# This will divide the html in slides, surrounding <hN> tags
# plus the following text in @<div class="slide">(...)</div>@.
class Codex::SlidesProcessor < Codex::PostProcessor
  register
  def process
    @html = @html.gsub(/(<h{1,6}.*?)(?=<h{1,6}|\z)/m, "\n<div class=\"slide\">\\1</div>")
  end
end