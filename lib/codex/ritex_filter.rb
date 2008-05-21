require 'ritex'

class RitexFilter < Codex::Filter
  tag :webtex
  
  def filter_single(text,args)
    puts "filter single"
    Ritex::Parser.new.parse(text)
  end
  
  def filter_inline(text,args)
    puts "filter inline"
    Ritex::Parser.new.parse(text)
  end
end