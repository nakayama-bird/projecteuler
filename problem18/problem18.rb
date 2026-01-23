arr = [75, 95, 64, 17, 47, 82, 18, 35, 87, 10, 20, 4, 82, 47, 65, 19, 1, 23, 75, 3, 34, 88, 2, 77, 73, 7, 63, 67, 99,
       65, 4, 28, 6, 16, 70, 92, 41, 41, 26, 56, 83, 40, 80, 70, 33, 41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14, 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57, 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
triangle = {}
index = 0
key = 1
while index < arr.length
  triangle[key] = arr[index, key]
  index += key
  key += 1
end

sum = 0
pos = 0

triangle.keys.sort.each do |row|
  current_value = triangle[row][pos]
  sum += current_value
  puts "#{row}行目: #{current_value} (位置#{pos}), 合計: #{sum}"

  # 最後の行でなければ、次に大きい方を選ぶ
  next unless row < triangle.keys.max

  left = triangle[row + 1][pos]
  right = triangle[row + 1][pos + 1]
  pos += 1 if right > left # 右の方が大きければ位置を1つ右に
end

puts "\n最終合計: #{sum}"
