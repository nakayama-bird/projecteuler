# 元の方法
a = 0
1.upto(100) { |i| a += i**2 }
b = 0
1.upto(100) { |i| b += i }
p a
p b**2
p b**2 - a

# 公式を使った最適化版
n = 100
sum = n * (n + 1) / 2 # 1からnまでの和
sum_of_squares = n * (n + 1) * (2 * n + 1) / 6 # 1からnまでの平方和

puts "\n公式使用:"
p sum_of_squares
p sum**2
p sum**2 - sum_of_squares
