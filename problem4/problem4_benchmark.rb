require 'benchmark'

def palindrome_numbers?(num)
  str = num.to_s
  str == str.reverse
end

# 元のコード
def original_method
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

  palindrome_numbers
end

# 最適化版
def optimized_method
  max_palindrome = 0

  999.downto(100) do |n_1|
    n_1.downto(100) do |n_2|
      product = n_1 * n_2
      break if product <= max_palindrome

      max_palindrome = product if palindrome_numbers?(product)
    end
  end

  max_palindrome
end

puts '=== 結果の確認 ==='
puts "Original: #{original_method}"
puts "Optimized: #{optimized_method}"
puts

puts '=== ベンチマーク ==='
Benchmark.bm(15) do |x|
  x.report('Original:') { original_method }
  x.report('Optimized:') { optimized_method }
end

#=== 結果の確認 ===
# Original: 906609
# Optimized: 906609

# === ベンチマーク ===
#                       user     system      total        real
# Original:         0.060591   0.000296   0.060887 (  0.060963)
# Optimized:        0.001026   0.000005   0.001031 (  0.001031)
