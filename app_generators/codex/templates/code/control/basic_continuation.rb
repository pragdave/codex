def open_box(continuation)
  continuation.call if rand < 0.5
end

callcc do |continuation|
  puts "opening box"
  open_box(continuation)
  puts "Phew--kitty's OK"
end

puts "closing box"