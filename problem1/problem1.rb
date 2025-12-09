n = 0
(1...1000).each do |i|
  next unless i % 3 == 0 || i % 5 == 0

  n += i
  pp n
end

puts n # 233168
