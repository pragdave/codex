# Graphviz filter

require 'digest/md5'
require 'facets/fileutils/which.rb'

module Codex::GraphvizFilter
  OUTPUT_DIR="html/images/"
  LINK_DIR="images/"

  class Descriptor
    attr_reader :engine, :width, :height, :file_name, :file_type

    include FileUtils

    raise "Graphviz ('dot') is not installed." unless which('dot')

    def initialize(string)
      @engine = "dot"
      @file_type = "svg"
      @width = nil
      @height = nil
      @file_name = nil

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
          when "engine"
            @engine = $2
            fail "Unknown engine value. Choices are: dot,neato,twopi and circo." unless @engine =~ /dot|neato|twopi|circo/
          when "width"
            @width = $2
          when "height"
            @height = $2
          when "type"
            @file_type = $2
            fail "Unknown output format. Choices are: png,jpeg and svg" unless @file_type =~ /png|jpeg|svg/
          when "options" # Additional options for graphviz
            @extra_options = $2
          else
            fail "Unknown parameter #{$1} in '#{params}'"
          end
        end
      end
    end

    def graphviz_cmd(outputfile)
      exec = which(@engine)
      file = (@file_name.nil? or @file_name.empty?)?"":File.expand_path(@file_name)
      "#{exec} #{file} -T#{@file_type} -o#{outputfile} #{@extra_options}"
    end
  end

  class GraphViz < Codex::Filter
    tag :graphviz

    def filter_inline(text,args)
      d = Descriptor.new(args)
      output_file = "graphviz-" + Digest::MD5.hexdigest(text) + "." + d.file_type
      IO.popen(d.graphviz_cmd(OUTPUT_DIR + output_file),"w") do |pipe|
        pipe.write text
        pipe.close_write
      end
      to_html(d,output_file)
    end

    def filter_single(args)
      d = Descriptor.new(args)
      output_file = File.basename(d.file_name) + "." + d.file_type
      system d.graphviz_cmd(OUTPUT_DIR + output_file)
      to_html(d,output_file)
    end

    def to_html(d,output_file)
      if d.file_type == "svg"
        %{<object type="image/svg+xml" name="graphviz" data="#{LINK_DIR + output_file}" #{width_html(d)} #{height_html(d)}">\n} +
        %{If you a seeing this text, your browser probably doesn't support SVG. Try setting the filetype=png option instead.} +
        %{</object>}
      else
        %{<img type="image/#{d.file_type}" name="#{d.file_name}" src="#{output_file}" #{width_html(d)} #{height_html(d)}">\n} +
        %{</img>}
      end
    end

    def width_html(desc)
      if desc.width.nil?
        ""
      else
        %{width="#{desc.width}"}
      end
    end

    def height_html(desc)
      if desc.height.nil?
        ""
      else
        %{width="#{desc.height}"}
      end
    end
  end
end