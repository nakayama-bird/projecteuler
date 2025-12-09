# 等差数列の和の公式を使用: sum = n * (first + last) / 2
def sum_divisible_by(divisor, limit)
  n = (limit - 1) / divisor # 倍数の個数
  divisor * n * (n + 1) / 2 # 等差数列の和
end

limit = 1000
result = sum_divisible_by(3, limit) + sum_divisible_by(5, limit) - sum_divisible_by(15, limit)

puts result # 233168
