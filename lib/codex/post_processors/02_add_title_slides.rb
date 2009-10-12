# This allows you to create title slides in the middle of presentations,
# using:
#   h1(slide0). Slide that only has a title
# This is used by the @rake all@ task,
# that will build the @html/all.html@ file.
class Codex::AddTitleSlides < Codex::PostProcessor
  register
  def process
    @html = @html.gsub(/<div class="slide">\s*<h1 class="slide0"/m, %{<div class="title slide">\n<h1})
  end
end