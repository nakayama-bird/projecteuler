x = 1
y = 2
result = 0

while x <= 4_000_000 || y <= 4_000_000
  if x < y
    result += x if x.even?
    x += y
  else
    result += y if y.even?
    y = x + y
  end
end

pp result
