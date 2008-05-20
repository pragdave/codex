require 'ritex'

class RitexFilter < Codex::Filter
  tag :webtex
  
  def filter_single(text,args)
    Ritex::Parser.new.parse(text)
  end
  
  def filter_inline(text,args)
    Ritex::Parser.new.parse(text)
  end
end