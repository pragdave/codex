module Codex
  module PostProcessor
    
    def self.process(content)
      Codex::PostProcessor::Slides.new(content).process!
    end
  end
end