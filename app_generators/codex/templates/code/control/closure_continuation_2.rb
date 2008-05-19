def create_continuation(arg)
  callcc { |continuation| return continuation }
  puts "Back in method: arg = #{arg}"
end

cont_one = create_continuation(123)
cont_one.call

### Results in:
#
# Back in method: arg = 123
# closure_continuation_2.rb:8: undefined method `call' for nil:NilClass
