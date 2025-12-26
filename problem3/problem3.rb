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

prime_number = []
number = 600_851_475_143
PrimeFactor.each do |prime|
  if number % prime == 0 # numberで判定
    prime_number << prime
    number /= prime while number % prime == 0 # /= で代入
  end
  break if number == 1
end

puts prime_number

# othrer solution

# num = ARGV.first.to_i
# factors = []

# def first_prime_factor(n, start)
#   (start..n).find { |x| n % x == 0 }
# end

# remain = num
# while 1 < remain
#   start = (factors.last || 1) + 1
#   x = first_prime_factor(remain, start)
#   factors.push x
#   remain /= x
# end
