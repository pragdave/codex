# This is a sample post processor. It will convert all 
# slide titles to upper case.
# PostProcessors have to subclass Codex::PostProcessor
# and overwrite the #process. You can then edit the @html 
# variable, which holds the content of the parsed slides
# in HTML.
class UpcaseTitles < Codex::PostProcessor
  # Uncomment the next line to activate this post processor:
  # register
  def process
    @html = @html.gsub(/(<h1[^<>]*>)([^<>]*)(<\/h1>)/) do |match| 
      "#{$1}#{$2.upcase}#{$3}"
    end
  end
end