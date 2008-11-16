require 'yaml'
require 'erb'

module Codex
  class Pressie
    
    def initialize(metadata)
      YAML.load_file(metadata).each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def process(input, output)
      content = Content.new(input).to_html
      File.open(output, 'w') do |f|
        f << ERB.new(File.read(File.join(Codex.root, 'templates', 'layout.erb'))).result(binding)
      end
    end
  
  end
end
