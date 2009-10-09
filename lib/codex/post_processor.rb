module Codex
  class PostProcessor
    # Call this in your subclass to register the PostProcessor
    def self.register
      PostProcessors.instance << self
    end 
    attr_reader :html
    def initialize(html)
      @html = html
    end
    def process
      raise "Overwrite me!"
    end
  end
  class PostProcessors
    include Singleton
    def << (post_processor_class)
      @post_processors << post_processor_class
    end
    def process_all(html)
      @new_html = html
      @post_processors.each do |pp_class|
        processor = pp_class.new(@new_html)
        processor.process
        @new_html = processor.html
      end
      @new_html
    end
    
    private
    
    def initialize
      @post_processors = []
    end
    
  end
  
end

# Requires all Post Processores files inside the lib and the slides directory.
# Ignores errors so that processors that depend on external libs and gems
# that are not present won't break the app.
Dir.glob([
    File.join(File.dirname(__FILE__), 'post_processors/*.rb'), 
    File.join(APP_ROOT, 'post_processors/*.rb')
    ]) do |post_processor|
  begin
    require(post_processor)
  rescue Exception => e
    ;
  end
end