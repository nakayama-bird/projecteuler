# 一番大きい3桁同士の掛け算 999 x 999 = 998001
# 1マイナスするごとに 999だけ引かれていく
# 999 * 999
# 999 * 998
# 999 * 997
# 回文数出てきたらその数を格納して 999 *の処理は終了する
# 次に998 * 998から順に試す
# 回文数が出る or 格納している数より小さくなったら次のStepへ

def palindrome_numbers?(num)
  str = num.to_s
  str == str.reverse
end

n_1 = 999
n_2 = 999
palindrome_numbers = 0

loop do
  product = n_1 * n_2

  palindrome_numbers = product if palindrome_numbers?(product) && (palindrome_numbers < product)

  n_2 -= 1

  if n_2 < 100
    n_1 -= 1
    n_2 = n_1
  end

  break if n_1 < 100
end

puts palindrome_numbers

# othrer solution

max_palindrome = 0

999.downto(100) do |n_1|
  n_1.downto(100) do |n_2|
    product = n_1 * n_2
    break if product <= max_palindrome # これ以上大きくならない

    max_palindrome = product if palindrome_numbers?(product)
  end
end

puts max_palindrome
