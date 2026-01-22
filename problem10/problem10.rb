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

sum_number = 0
lasted_prime = 0
PrimeFactor.each do |prime|
  sum_number += prime
  lasted_prime = prime
  break if prime > 2_000_000
end
pp sum_number - lasted_prime
