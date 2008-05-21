require 'ritex'

class RitexFilter < Codex::Filter
  tag :webtex
  
  # Expect something like
  # :webtex \alpha\beta\gamma
  def filter_single(text,args)
    Ritex::Parser.new.parse(args)
  end

  # parse everythingenclosed in :inlinewebtex .. :end
  def filter_inline(text,args)
    Ritex::Parser.new.parse(text)
  end
end