require 'redcloth'

class Codex::Content
  START_SLIDE = %{<div class="slide">\n}
  END_SLIDE   = %{</div>\n}
  BETWEEN_SLIDES = END_SLIDE + "\n" + START_SLIDE

  def initialize(original)
    @original = original.sub(/__END__.*/m, '').gsub(/__SKIP__.*?__ENDSKIP__/m, '')
  end

  def to_html
    textile = Codex::Filters.instance.filter_all(@original)
    content = split_into_slides(textile)
    html = RedCloth.new(content).to_html
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