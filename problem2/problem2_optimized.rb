# 偶数フィボナッチの和
x = 2
y = 8
sum = 2
while y <= 4_000_000
  sum += y
  x, y = y, 4 * y + x # 偶数フィボナッチ数の漸化式
end

puts sum
