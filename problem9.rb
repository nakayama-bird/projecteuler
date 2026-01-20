# a + b + c = 1000
# 1000 - a - b

(1..998).each do |a|
  (a + 1..999).each do |b|
    if a**2 + b**2 == (1000 - a - b)**2
      puts a * b * (1000 - a - b)
      break
    end
  end
end

# 解答例で見つけた別解
# ピタゴラス数の三つ組で a + b + c = n のとき、a が n/2 を超えることはない(a < b < c より)
# 厳密にはもっと絞り込めるはず、なぜならbとcはより大きくなるので
n = 1000
a = (1..n / 2).to_a.find do |a|
  (n * (n / 2 - a) % (n - a)).zero?
end
b = n * (n / 2 - a) / (n - a)
puts "Product is #{a * b * (n - a - b)}."
