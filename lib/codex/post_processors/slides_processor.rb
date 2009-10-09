class Codex::PostProcessor::Slides
  
  def initialize(content)
    @content = content
  end
  
  def process!
    @content.gsub(/(<h{1,6}.*?)(?=<h{1,6}|\z)/m, '<div class="slide">\1</div>')
  end
  
end