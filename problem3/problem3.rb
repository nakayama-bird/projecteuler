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
PrimeFactor.each do |prime|
  prime_number << prime if 600_851_475_143 % prime == 0
  break if prime > Math.sqrt(600_851_475_143)
end

puts prime_number

# othrer solution

num = ARGV.first.to_i
factors = []

def first_prime_factor(n, start)
  (start..n).find { |x| n % x == 0 }
end

remain = num
while 1 < remain
  start = (factors.last || 1) + 1
  x = first_prime_factor(remain, start)
  factors.push x
  remain /= x
end
