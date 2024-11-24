import math

# 素因数分解
def factorization(n):
    fact = []
    for i in range(2, math.ceil(math.sqrt(n))):
        if n % i == 0:
            cnt = 0
            while n % i == 0:
                cnt += 1
                n //= i
            fact.append([i, cnt])

    if n != 1:
        fact[n] = 1

    return fact

# メルセンヌ数かの判定
def is_mersenner_number(n):
    if n <= 0:
        return False
    return bin(n).count('1') == len(bin(n)) - 2

# トーシェント関数
def totient(n):
    res = 1
    for i in range(2, n):
        if math.gcd(n, i) == 1:
            res += 1
    return res