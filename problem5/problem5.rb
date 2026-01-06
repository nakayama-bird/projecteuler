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

(1..20).each do |target|
  prime_number = []
  number = target
  PrimeFactor.each do |prime|
    if number % prime == 0
      count = 0
      while number % prime == 0
        count += 1
        number /= prime
      end
      count.times { prime_number << prime }
    end
    break if number == 1
  end

  puts "#{target}: #{prime_number}"
end

max_counts = Hash.new(0)

(1..20).each do |target|
  number = target
  PrimeFactor.each do |prime|
    if number % prime == 0
      count = 0
      while number % prime == 0
        count += 1
        number /= prime
      end
      max_counts[prime] = [max_counts[prime], count].max
    end
    break if number == 1
  end
end

result = []
pp max_counts
max_counts.sort.each do |prime, count|
  count.times { result << prime }
end

p result
p result.reduce(1, :*)

# othrer solution
(1..20).reduce { |x, y| x.lcm(y) }

# https://github.com/ruby/ruby/blob/ad6b85450db1b252660dae4b514f5be35ccd38b9/rational.c#L339-L368
