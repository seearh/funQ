// Take in a pair of positive integers
// Return all the prime numbers that lie between them
prime: {
    low: 0;
    high: x|y;
    l: low + til (1+high-low);                                  / List of whole numbers up till high
    l: l where (l<>1) and (l mod 2) or l=2;                     / Remove 1, and even numbers not equal 2
    l: l where all each 0 <> l {y mod x where x <= y%2}/: l;    / Remove numbers that is divisible by any number other than itself
    l where l>x&y                                               / Return values between given range
    }

// Splits a number into a count dictionary of prime factors
split_into_prime_factors: { [num]
    relevant_primes: prime[1;floor num%2];      / Numbers cannot be divisible by a prime bigger than half of itself
    quotients: reverse -1_({ x: x % first y where not x mod y }[;relevant_primes]\) num     / Workings of dividing by prime factors until 1
    count each group factors where not null factors: (%':) quotients        / Work out divisors and group into a count dictionary
    }

// Take in a list of whole numbers
// Return the Smallest Common Multiple
scm: { [l]
    prime_factors: key raze prime_factors_dicts: split_into_prime_factors each l;
    
    }