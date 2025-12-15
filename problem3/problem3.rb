n = 600_851_475_143
squrt_num = 2..Integer.sqrt(n)
prime_num = []

squrt_num.each do |i|
  next unless n % i != 0

  prime_num << i
  n /= i
end
pp prime_num_1

prime_num_1.each do |i|
  primeMath.log2(i) if i.even?
end
