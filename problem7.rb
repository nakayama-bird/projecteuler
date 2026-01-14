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

count = 0
prime_number = nil

PrimeFactor.each do |prime|
  count += 1
  if count == 10_001
    prime_number = prime
    break
  end
end

puts prime_number
