require 'benchmark'

class PrimeFactor
  def self.each
    n = 2
    loop do
      yield n if prime?(n)
      n += 1
    end
  end

  def self.prime?(num)
    return false if num < 2

    (2..Math.sqrt(num)).each do |i|
      return false if num % i == 0
    end
    true
  end
end

TARGET = 600_851_475_143

# 元のコード
def original_method
  prime_number = []
  PrimeFactor.each do |prime|
    prime_number << prime if TARGET % prime == 0
    break if prime > Math.sqrt(TARGET)
  end
  prime_number
end

# 改善版: numberを小さくしていく
def improved_method
  prime_number = []
  number = TARGET
  PrimeFactor.each do |prime|
    if number % prime == 0
      prime_number << prime
      number /= prime while number % prime == 0
    end
    break if number == 1
  end
  prime_number
end

puts '=== 結果の確認 ==='
puts "Original: #{original_method.inspect}"
puts "Improved: #{improved_method.inspect}"
puts

puts '=== ベンチマーク ==='
Benchmark.bm(15) do |x|
  x.report('Original:') { original_method }
  x.report('Improved:') { improved_method }
end
