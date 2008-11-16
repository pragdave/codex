module Codex
  class TemplateHandler
    include Singleton
    
    attr_reader :handlers
    
    def initialize
      # just return the content for unknown formats
      @handlers = Hash.new(lambda {|c| c })
    end
    
    def self.register(extension, &klass)
      instance.handlers[extension.to_s] = klass
    end
    
    def self.choose(file)
      instance.handlers[File.extname(file.to_s).sub(/^\./, '')]
    end
  end
end

Codex::TemplateHandler.register :textile do |content|
  require 'redcloth'
  RedCloth.new(content).to_html
end
Codex::TemplateHandler.register :markdown do |content|
  require 'bluecloth'
  BlueCloth.new(content).to_html
end
