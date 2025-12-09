# 1 1
# 2 4
# 3 9
# 4 16
# 5 25
# 6 36

n = 0

(1..494_000).each do |i|
  n += i * i if i.odd?
end

puts n

(1..494_000).map { |i| i * i if i.odd? }.compact.sum

# 数学的な公式を使用: n個の奇数の平方の合計 = n(2n-1)(2n+1)/3
n = 247_000  # 494,000までの奇数の個数
result = n * (2 * n - 1) * (2 * n + 1) / 3

puts result
