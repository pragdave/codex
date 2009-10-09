# This is a sample post processor. It will change the links to 
# the code samples from the TextMate specific "txmt://open?url=File:///(...)"
# to the general "File:///(...)", which will also work in Linux or Windows
# browsers without any hacking.
#
# PostProcessors have to subclass Codex::PostProcessor and 
# overwrite the #process. You can then edit the @html variable, 
# which holds the content of the parsed slides in HTML.
class ChangeCodeURLs < Codex::PostProcessor
  # Uncomment the next line to activate this post processor:
  # register
  def process
    # it will
    @html = @html.gsub(/href="txmt:\/\/open\?url=/, "href=")
  end
end