x = 1
y = 1
sum = 0
while (x + y) <= 100
  sum += (x + y)
  x, y = x + 2 * y, 2 * x + 3 * y
  pp x
  pp y
end
