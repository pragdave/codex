require 'redcloth'

class Codex::Content

  def initialize(filename)
    @filename = filename
    @original = File.read(@filename).sub(/__END__.*/m, '').gsub(/__SKIP__.*?__ENDSKIP__/m, '')
  end

  def to_html
    content = Codex::Filters.instance.filter_all(@original)
    html = Codex::TemplateHandler.choose(@filename).call(content)
    Codex::PostProcessor.process(html)
  end
  
end