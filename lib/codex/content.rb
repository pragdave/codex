require 'redcloth'

class Codex::Content
  START_SLIDE = %{<div class="slide">\n}
  END_SLIDE   = %{</div>\n}
  BETWEEN_SLIDES = END_SLIDE + "\n" + START_SLIDE

  def initialize(filename)
    @filename = filename
    @original = File.read(@filename).sub(/__END__.*/m, '').gsub(/__SKIP__.*?__ENDSKIP__/m, '')
  end

  def to_html
    content = Codex::Filters.instance.filter_all(@original)
    Codex::TemplateHandler.choose(@filename).call(split_into_slides(content))
  end
  
  def split_into_slides(textile)
    result = []
    slides = textile.split(/^h1/).each do |slide|
      unless slide.empty?
        result << START_SLIDE << "\nh1" << slide << END_SLIDE
      end
    end
    result.join
  end
end