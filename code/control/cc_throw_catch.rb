#START:stack
class CatchStack
  Frame = Struct.new(:symbol, :cc)
  
  def stack
    Thread.current[:catch_stack] ||= []
  end
  
  def wrap(symbol, cc)
    stack << Frame.new(symbol, cc)
    begin
      yield
    ensure
      stack.pop
    end
  end
  
  def find_continuation_for(symbol)
      stack.pop until stack.empty? || stack.last.symbol == symbol
      if stack.empty?
        fail NameError, "uncaught throw `#{sym}'"
      else
        stack.pop.cc
      end
  end
end
#END:stack

#START:CC
module CC
  CATCH_STACK = CatchStack.new
  
  def self.catch(sym)
    callcc do |cc|
      CATCH_STACK.wrap(sym, cc) do
        yield 
      end
    end
  end
  
  def self.throw(sym, value=nil)
    cc = CATCH_STACK.find_continuation_for(sym)
    cc.call(value)
  end
end
#END:CC

#START:body
def test_method
  CC.throw(:x, "thrown X") if rand < 0.5
end

result = CC.catch(:x) do
          test_method
          "normal exit"
        end
        
puts "Result is #{result}"
#END:body