n = 600_851_475_143
prime_factors = []

if n.even?
  prime_factors << 2
  loop do
    break unless n.even?

    n /= 2
  end
end

if (n % 3).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 5).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 7).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 11).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 13).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 17).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 19).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 23).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 29).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 31).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

if (n % 37).zero?
  prime_factors << 3
  loop do
    break unless (n % 3).zero?

    n /= 3
  end
end

require 'prime'
pp "#{n} is prime: #{n.prime?}"

pp prime_factors
pp n
