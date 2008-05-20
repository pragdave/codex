# This is an abstract class for user defined filters.
# It lets them declare the tag they wish to use.
module Codex 
  class Filter
    def self.tag(tag)
      (Filters.instance)[tag] = self.new
    end
  end

  class Filters
    @@instance = nil
    attr_accessor :filter_file_tags, :filter_inline_tags, :filter_inline_end_tags

    def self.instance
      @@instance = self.new if @@instance.nil?
      @@instance
    end
    
    def []=(idx,val)
      @filters[idx] = val
    end
    
    def [](idx)
      @filters[idx]
    end

    # Look for :inlinecode /.../:endinlinecode and substitute in as if it came from a file
    def filter_all(text)
      state = :copying
      result = []
      tagged_lines = []
      text.split(/\n/).each do |line|
        case state
        when :copying
          if line =~ inline_tag
            tag = $1
            args = $2.strip
            state = :inside_tags
          elsif line =~ single_tag
            result << @filters[tag].filter_single()
          else
            result << line
          end
        when :inside_tags
          if line =~ /^:end/ # :endwhatever or just plain :end
            result << @filters[tag].filter_inline(args, tagged_lines)
            tagged_lines = []
            state = :copying
          else
            tagged_lines << line
          end
        end
      end

      result.join("\n")
    end

    private
    def initialize
      @filters = {}
      # Load all user filters:
      Dir.glob("filters/*.rb").each { |f| require f }
    end

    def inline_tag
      @inline_tag_regex = tag_regexp("inline") if @inline_tag_regex.nil?
      @inline_tag_regex
    end

    def single_tag
      @single_tag_regex = tag_regexp if @single_tag_regex.nil?
      @single_tag_regex    
    end

    def tag_regexp(prefix = "")
      Regexp.new("^:#{prefix}(" + (@filters.map { |idx,filter| filter.tag.to_s }).join('|') + ")(.*)")
    end
  end
end