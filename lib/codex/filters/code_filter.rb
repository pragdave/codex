module Codex::CodeFilter
  class Descriptor
    attr_reader :file_name, :part
    attr_reader :css_class
    attr_reader :lang

    def initialize(string)
      @css_class = "code-normal"
      @lang = "ruby"

      if string && string =~ /^\[(.*)\]/
        @file_name = nil
        parse_params($1.dup)
      elsif string && string =~ /(.*?)\[(.*)\]/
        @file_name = $1
        parse_params($2.dup)
      else
        @file_name = string
      end
    end

    def parse_params(params)
      params.split.each do |param|
        if param =~ /(.*?)=(.*)/
          case $1
          when "class"
            @css_class = $2
          when "lang"
            @lang = $2
          else
            fail "Unknown parameter #{$1} in '#{params}'"
          end
        else
          @part = param
        end
      end
    end
  end

  class CodeFilter < Codex::Filter
    tag :code

    def filter_single(args)
      desc = Descriptor.new(args)
      content = find_content_from(desc)
      format_code(desc, content)
    end

    def filter_inline(text,args)
      desc = Descriptor.new(args)
      format_code(desc, text)
    end

    def format_code(desc, code)
      %{<div class="#{desc.css_class}">\n} +
      %{\n<pre name="code" class="#{desc.lang}:nogutter:nocontrols">#{code}} +
      %{</pre></div>} +
      format_link(desc)
    end

    def format_link(desc)
      if desc.file_name.nil?
        "\n\n"
      else
        %{<div class="codeurl"><a href="txmt://open?url=file://#{File.expand_path(desc.file_name)}">#{desc.file_name}</a></div>\n\n}
      end
    end

    def find_content_from(desc)
      find_part_in(File.read(desc.file_name), desc.part)
    end

    def find_part_in(content, part_name)
      result = []
      state = part_name ? :skipping : :normal
      content.each_line do |line|
        if line.sub!(/(START|END):(\w+)/, '')
          if $2 == part_name
            if $1 == "START"
              state = :normal
            else
              state = :skipping
            end
          end
          next
        end
        result << line unless state == :skipping
      end
      result.join
    end
  end
end