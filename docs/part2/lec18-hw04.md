# Lecture 18 --- HW 04

## Lecture 18 Objects

### 1

![cs61a_80](./images/cs61a_80.png){ loading=lazy }

关于 class 和 object 之间的关系的形容

::: info 引述
关于 class 和 object 的解释：

-   **class**: A class combines (and abstracts) data and functions
-   **object**: An object is an instantiation of a class
:::

### 2

![cs61a_81](./images/cs61a_81.png){ loading=lazy }

类内的方法在编写是，第一个参数须是 `self` ，

但类内方法在被调用的时候，不需要传入 `self` 的值，或者说 `self` 就是调用方法的实例，所以只需要传入之后的参数

### 3

![cs61a_82](./images/cs61a_82.png){ loading=lazy }

python有内置函数可以查询/访问类的实例的*属性(attribute)*，或者是类的属性 (**<mark>类内的方法算作是类本身的属性，而不是具体实例的属性</mark>**)

`getattr()` 可以访问属性，获取对应的值

`hasatrr()` 可以看是否有某个属性

**函数的第一个参数需要传入实例，第二个参数需要传入要查询的属性的属性名(以字符串传入)**

### 4

![cs61a_83](./images/cs61a_83.png){ loading=lazy }

如上图，`类名.方法名` 是一个函数，并且 `self` 参数需要传入东西，而 `对象.方法名` 是一个方法，`self` 不用传

### 5

![cs61a_84](./images/cs61a_84.png){ loading=lazy }

**类属性**

如上图，在类中赋值的变量，(应该)就是类的属性(类内的方法也算是类的属性，第3点有提到过)，

**<mark>类属性不是对象/实例的一部分，而是类的一部分</mark>。每次通过对象来访问类属性，访问的是类中的属性，而通过 `对象.属性名` 赋值/更改属性，其实是在对象中创建/更改对应的属性(所以通过对象修改“类属性”不会更改实际的类属性)**

## Lecture 18 Q&A

### 1

类属性除了可以在类内定义，也可以在类以外，通过 `类名.属性名` 的形式赋值去定义，如

```python
class Account:
    ...
    
Account.interest = 0.03
```

>   ```python
>   >>> Account.interest  0.03
>   >>> a = Account('John')
>   >>> a.interest
>   0.03
>   >>> a.interest = 0.05
>   >>> a.interest
>   0.05
>   >>> b = Account('Hany')
>   >>> b.interest
>   0.03
>   >>> a.interest
>   0.05
>   >>> a.interest = Account.interest
>   >>> a.interest
>   0.03
>   >>> Account.interest = 0.04
>   >>> a.interest
>   0.03
>   >>>
>   ```

John的这段代码演示，显示了通过对象来修改“类属性”(指相同的名字)时，其实是修改的是具体对象中的属性

类和对象**两者各自的修改都不会影响到对方的属性**

**`del` 语句**，经过测试，是可以将对象中已有的属性清除掉，从而再次访问相同的属性名时，获取到的是类属性的值

```python
>>> class Account:
...     def __init__(self):
...         return
...
>>> Account.interest = 5
>>> p1 = Account()
>>> p1.interest
5
>>> del p1.interest
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: interest
>>> p1.interest += 2
>>> p1.interest
7
>>> Account.interest
5
>>> del p1.interest
>>> p1.interest
5
>>> del p1.interest
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: interest
>>>
```

### 2

![cs61a_85](./images/cs61a_85.png){ loading=lazy }

`del` 也可以删除列表中的元素，

但是John说 `del` 不常用

## HW 04

### 1

Q4

::: tip
*Hint:* If you had the permutations of all the elements in `seq` not including the first element, how could you use that to generate the permutations of the full `seq`?
:::

这个提示很有用：考虑每次抽去其中一个元素的情况，然后依次递归...

一开始感觉能用推导式写成一行

```python
def permutations(seq):
    yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:]) for i in range(len(seq))]
```

然后发现，`i` 只对 `permutations(seq[:i] + seq[i + 1:])` 生效，`[seq[i]]` 中 `i` 显示未定义

然后改成

```python
def permutations(seq):
    for i in range(len(seq))
        yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])]
```

然后在测试文档的一个测试用例中，用 `next()` 使用函数返回的生成器，显示 `StopIteration` ，

思考了很久，发现是因为，递归到了最后， `permutations(seq[:i] + seq[i + 1:])` 传入的是空列表，那么就不能*解压*出 `p` ，那么推导式的结果就会是空的列表，再一层层返回，所以最后整体的函数返回的生成器中没有可以迭代的元素

所以需要设置 base case ，(一开始以为不需要设置，或者说以为空列表就可以作为 base case)

```python
def permutations(seq):
    if len(seq) == 1:
        yield seq
    else:
        yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])]
```

然后发现，测试文档中，有一个传入了元组，所以我稍加了修改

```python
def permutations(seq):
    seq = list(seq)
    if len(seq) == 1:
        yield seq
    else:
        yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])]
```

>   后面发现，其实这样改也可以：
>
>   ```python
>   def permutations(seq):
>       if len(seq) == 1:
>           yield [seq[0]]
>       else:
>           yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])]
>   ```

在思索到底一行语句实现功能是否可行时，想到了 `sum()` 函数，想到可以用它来把结果合并在一个列表中

```python
def permutations(seq):
    yield from sum([[... for p in permutations(seq[:i] + seq[i + 1:])] for i in range(len(seq))], start=[])
```

然后想到可以把 base case 放在 `sum` 函数外面

```python
def permutations(seq):
    yield from [[seq[0]]] if len(seq) == 1 else sum([[[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])] for i in range(len(seq))], start=[])    
```

::: details 代码
```python
def permutations(seq):
    """Generates all permutations of the given sequence. Each permutation is a
    list of the elements in SEQ in a different order. The permutations may be
    yielded in any order.

    >>> perms = permutations([100])
    >>> type(perms)
    <class 'generator'>
    >>> next(perms)
    [100]
    >>> try: #this piece of code prints "No more permutations!" if calling next would cause an error
    ...     next(perms)
    ... except StopIteration:
    ...     print('No more permutations!')
    No more permutations!
    >>> sorted(permutations([1, 2, 3])) # Returns a sorted list containing elements of the generator
    [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    >>> sorted(permutations((10, 20, 30)))
    [[10, 20, 30], [10, 30, 20], [20, 10, 30], [20, 30, 10], [30, 10, 20], [30, 20, 10]]
    >>> sorted(permutations("ab"))
    [['a', 'b'], ['b', 'a']]
    """
    "*** YOUR CODE HERE ***"
    # seq = list(seq)
    # if len(seq) == 1:
    #     yield seq
    # else:
    #     for i in range(len(seq)):
    #         yield from [[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])]
    yield from [[seq[0]]] if len(seq) == 1 else sum([[[seq[i]] + p for p in permutations(seq[:i] + seq[i + 1:])] for i in range(len(seq))], start=[])
```
:::

### 2

Q5

>   Use `type(value) == str` to test if some `value` is a string

可以使用 `type(value) == str` 来判断一个东西是否是字符串

感觉我最后答案中的这一行是关键的地方：

```python
def make_joint(with_draw, old_pass, new_pass):
    def joint(amount, pw_input):
        ...
        return withdraw(amount, pw_input)  # key point
    ...
    return joint
```

::: details 代码
```python
def make_joint(withdraw, old_pass, new_pass):
    """Return a password-protected withdraw function that has joint access to
    the balance of withdraw.

    >>> w = make_withdraw(100, 'hax0r')
    >>> w(25, 'hax0r')
    75
    >>> make_joint(w, 'my', 'secret')
    'Incorrect password'
    >>> j = make_joint(w, 'hax0r', 'secret')
    >>> w(25, 'secret')
    'Incorrect password'
    >>> j(25, 'secret')
    50
    >>> j(25, 'hax0r')
    25
    >>> j(100, 'secret')
    'Insufficient funds'

    >>> j2 = make_joint(j, 'secret', 'code')
    >>> j2(5, 'code')
    20
    >>> j2(5, 'secret')
    15
    >>> j2(5, 'hax0r')
    10

    >>> j2(25, 'password')
    'Incorrect password'
    >>> j2(5, 'secret')
    "Frozen account. Attempts: ['my', 'secret', 'password']"
    >>> j(5, 'secret')
    "Frozen account. Attempts: ['my', 'secret', 'password']"
    >>> w(5, 'hax0r')
    "Frozen account. Attempts: ['my', 'secret', 'password']"
    >>> make_joint(w, 'hax0r', 'hello')
    "Frozen account. Attempts: ['my', 'secret', 'password']"
    """
    "*** YOUR CODE HERE ***"
    def joint(amount, pw_input):
        if pw_input == new_pass:
            return withdraw(amount, old_pass)
        else:
            return withdraw(amount, pw_input)
    old_result = withdraw(0, old_pass)
    if type(old_result) == str:
        return old_result
    return joint
```

### 3

Q6

::: details 代码
```python
def remainders_generator(m):
    """
    Yields m generators. The ith yielded generator yields natural numbers whose
    remainder is i when divided by m.

    >>> import types
    >>> [isinstance(gen, types.GeneratorType) for gen in remainders_generator(5)]
    [True, True, True, True, True]
    >>> remainders_four = remainders_generator(4)
    >>> for i in range(4):
    ...     print("First 3 natural numbers with remainder {0} when divided by 4:".format(i))
    ...     gen = next(remainders_four)
    ...     for _ in range(3):
    ...         print(next(gen))
    First 3 natural numbers with remainder 0 when divided by 4:
    4
    8
    12
    First 3 natural numbers with remainder 1 when divided by 4:
    1
    5
    9
    First 3 natural numbers with remainder 2 when divided by 4:
    2
    6
    10
    First 3 natural numbers with remainder 3 when divided by 4:
    3
    7
    11
    """
    "*** YOUR CODE HERE ***"
    def helper(i):
        # yield from [n * m + i for n in naturals()]
        if i != 0:
            yield i
        for n in naturals():
            yield n * m + i
    yield from [helper(i) for i in range(m)]
```
:::
