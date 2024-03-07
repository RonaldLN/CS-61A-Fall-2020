HW_SOURCE_FILE=__file__


def num_eights(x):
    """Returns the number of times 8 appears as a digit of x.

    >>> num_eights(3)
    0
    >>> num_eights(8)
    1
    >>> num_eights(88888888)
    8
    >>> num_eights(2638)
    1
    >>> num_eights(86380)
    2
    >>> num_eights(12345)
    0
    >>> from construct_check import check
    >>> # ban all assignment statements
    >>> check(HW_SOURCE_FILE, 'num_eights',
    ...       ['Assign', 'AugAssign'])
    True
    """
    "*** YOUR CODE HERE ***"
    if x < 10:
        return 1 if x == 8 else 0
    else:
        # x, last_digit = x // 10, x % 10
        # return num_eights(x // 10) + (1 if x % 10 == 8 else 0)
        return num_eights(x // 10) + num_eights(x % 10)



def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(8)
    8
    >>> pingpong(10)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    -2
    >>> pingpong(30)
    -2
    >>> pingpong(68)
    0
    >>> pingpong(69)
    -1
    >>> pingpong(80)
    0
    >>> pingpong(81)
    1
    >>> pingpong(82)
    0
    >>> pingpong(100)
    -6
    >>> from construct_check import check
    >>> # ban assignment statements
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    "*** YOUR CODE HERE ***"
    # def is_contain_eight(x):
    #     if x < 10:
    #         return x == 8
    #     else:
    #         if x % 10 == 8:
    #             return True
    #         else:
    #             return is_contain_eight(x // 10)
    # i = 1
    # up = True
    # num = 1
    # while i <= n:
    #     if up:
    #         num += 1
    #     else:
    #         num -= 1
    #     if i % 8 == 0 or is_contain_eight(i):
    #         up = not up
    #     i += 1
    # return num

    # if n == 0:
    #     return n, 1
    # else:
    #     if n % 8 == 0 or num_eights(n):
    #         return pingpong(n - 1)[0] + pingpong(n - 1)[1], pingpong(n)[1] * -1
    #     else:
    #         return pingpong(n - 1)[0] + pingpong(n - 1)[1], pingpong(n)[1]
    
    # def num_to_count(n):
    #     if n == 1:
    #         return 1
    #     else:
    #         return num_to_count(n - 1) * (-1 if n % 8 == 0 or num_eights(n) else 1)
    # return pingpong(n - 1) * num_to_count(n)

    # if n <= 8:
    #     return n
    # else:
    #     if (n - 1) % 8 == 0 or num_eights(n - 1):
    #         return pingpong(n - 2)
    #     else:
    #         return pingpong(n - 1) * 2 - pingpong(n - 2)

    # def helper(index, pingpong_num, direction):
    #     if index == n:
    #         return pingpong_num
    #     else:
    #         return helper(index + 1, pingpong_num + direction, direction * (-1 if (index + 1) % 8 == 0 or num_eights(index + 1) else 1))
    # return helper(1, 1, 1)
    def helper(index, pingpong_num, direction):
        if index == n:
            return pingpong_num + direction
        else:
            return helper(index + 1, pingpong_num + direction, direction * (-1 if index % 8 == 0 or num_eights(index) else 1))
    return helper(1, 0, 1)



def missing_digits(n):
    """Given a number a that is in sorted, increasing order,
    return the number of missing digits in n. A missing digit is
    a number between the first and last digit of a that is not in n.
    >>> missing_digits(1248) # 3, 5, 6, 7
    4
    >>> missing_digits(1122) # No missing numbers
    0
    >>> missing_digits(123456) # No missing numbers
    0
    >>> missing_digits(3558) # 4, 6, 7
    3
    >>> missing_digits(35578) # 4, 6
    2
    >>> missing_digits(12456) # 3
    1
    >>> missing_digits(16789) # 2, 3, 4, 5
    4
    >>> missing_digits(19) # 2, 3, 4, 5, 6, 7, 8
    7
    >>> missing_digits(4) # No missing numbers between 4 and 4
    0
    >>> from construct_check import check
    >>> # ban while or for loops
    >>> check(HW_SOURCE_FILE, 'missing_digits', ['While', 'For'])
    True
    """
    "*** YOUR CODE HERE ***"
    if n < 10:
        return 0
    else:
        difference = n % 10 - n // 10 % 10
        return (difference - 1 if difference else difference) + missing_digits(n // 10)


def next_largest_coin(coin):
    """Return the next coin. 
    >>> next_largest_coin(1)
    5
    >>> next_largest_coin(5)
    10
    >>> next_largest_coin(10)
    25
    >>> next_largest_coin(2) # Other values return None
    """
    if coin == 1:
        return 5
    elif coin == 5:
        return 10
    elif coin == 10:
        return 25


def count_coins(total):
    """Return the number of ways to make change for total using coins of value of 1, 5, 10, 25.
    >>> count_coins(15)
    6
    >>> count_coins(10)
    4
    >>> count_coins(20)
    9
    >>> count_coins(100) # How many ways to make change for a dollar?
    242
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(HW_SOURCE_FILE, 'count_coins', ['While', 'For'])                                          
    True
    """
    "*** YOUR CODE HERE ***"
    # def helper(rest, largest_coin, counting_coin):
    #     if counting_coin > largest_coin:
    #         return 0
    #     elif rest == counting_coin:
    #         return 1
    #     elif rest < counting_coin:
    #         return 0
    #     else:
    #         return helper(rest - counting_coin, largest_coin, 1) + helper(rest, largest_coin, next_largest_coin(counting_coin)) + helper(rest, next_largest_coin(largest_coin), 1)
    # return helper(total, 1, 1)

    def helper(index, largest_coin):
        if index == total:
            return 1
        elif index > total:
            return 0
        elif largest_coin == None:
            return 0
        else:
            return helper(index + largest_coin, largest_coin) + helper(index, next_largest_coin(largest_coin))
    return helper(0, 1)



from operator import sub, mul

def make_anonymous_factorial():
    """Return the value of an expression that computes factorial.

    >>> make_anonymous_factorial()(5)
    120
    >>> from construct_check import check
    >>> # ban any assignments or recursion
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial', ['Assign', 'AugAssign', 'FunctionDef', 'Recursion'])
    True
    """
    # return 'YOUR_EXPRESSION_HERE'
    return (lambda f: lambda n: f(f, n))(lambda f, i: 1 if i == 0 else i * f(f, i - 1))

