# エラトステネスの篩を使用した最適化版
class PrimeSieve
  def self.sieve(limit)
    return [] if limit < 2

    # ビット配列の代わりに配列を使用
    is_prime = Array.new(limit + 1, true)
    binding.irb
    is_prime[0] = is_prime[1] = false

    # 平方根までチェックすれば十分
    (2..Math.sqrt(limit).to_i).each do |i|
      next unless is_prime[i]

      # iの倍数を全て合成数としてマーク
      (i * i..limit).step(i) do |j|
        is_prime[j] = false
      end
    end

    # 素数のインデックスを収集
    primes = []
    is_prime.each_with_index do |is_p, num|
      primes << num if is_p
    end
    primes
  end
end

limit = 2_000_000
primes = PrimeSieve.sieve(limit)
sum_number = primes.sum
pp sum_number
