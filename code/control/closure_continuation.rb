def create_continuation(arg)
  callcc { |continuation| return continuation }
  puts "Back in method: arg = #{arg}"
  exit
end

cont_one = create_continuation(123)
cont_one.call      #=> Back in method: arg = 123