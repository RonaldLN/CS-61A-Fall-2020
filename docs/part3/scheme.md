# Project Scheme

### 1

Problem 1的前面某题我卡了一小会😅

```python
>>> from scheme_reader import *
>>> tokens = tokenize_lines(["(+ 1 ", "(23 4)) ("])
>>> src = Buffer(tokens)
>>> src.current()
? ...
-- OK! --

>>> src.pop_first()
? ...
-- OK! --

>>> src.current()
? ...
-- OK! --

>>> src.pop_first()
? ...
-- OK! --

>>> src.pop_first()
? ...
-- OK! --

>>> scheme_read(src)  # Removes the next complete expression in src and returns it as a Pair
? 
```

最后是看了 `scheme_reader.py` 中 `scheme_read` 的函数说明中

```python
def scheme_read(src):
    """Read the next expression from SRC, a Buffer of tokens.

    ...
    >>> scheme_read(Buffer(tokenize_lines(['(+ 1 2)'])))
    Pair('+', Pair(1, Pair(2, nil)))
    """
```

才明白 `returns it as a Pair` 具体返回是什么样子。

然后看到了题目说明中的

>   `scheme_read`:
>
>   -   If the current token is `(`, the expression is a pair or list. Call `read_tail` on the rest of `src` and return its result.
>
>   `read_tail`:
>
>   -   If the token is `)`, then we've reached the end of the list or pair. **Remove this token from the buffer** and return the `nil` object.

所以明白只会读取到第一个右括号 `)` ，因此最后正确答案是

```python
Pair(23, Pair(4, nil))
```

>   但是有个地方感觉有点小离谱😅，少了个空格居然显示错误
>
>   ```python
>   ? Pair(23, Pair(4,nil))
>   -- Not quite. Try again! --
>   
>   ? Pair(23, Pair(4, nil))
>   -- OK! --
>   ```

---

在实现 `read_tail` 时，意识到题目说明中的这句话

>   Both functions mutate the buffer, removing the tokens that have already been processed.

就是说，(比如被 `scheme_read` 调用的) `read_tail` 中需要*突变* `src` (移除已经使用过的*令牌*)，这样在 `read_tail` 中使用过的 *令牌 tokens* ，就不会被 `scheme_read` 或者上一层 `read_tail` 再次使用

---

没想到Problem 1就写了半小时(算上解锁花了一小时😇)。

这题主要是需要完全理解题目的意思，如果有bug就回去**重新理解题目(仔细阅读题目的说明)**就好了。

一开始我写的是

```python
def scheme_read(src):
    if src.current() is None:
        raise EOFError
    val = src.pop_first() # Get and remove the first token
    if val == 'nil':
        "*** YOUR CODE HERE ***"
        return nil
    elif val == '(':
        "*** YOUR CODE HERE ***"
        return read_tail(src)
    ...
def read_tail(src):
    try:
        if src.current() is None:
            raise SyntaxError('unexpected end of file')
        elif src.current() == ')':
            "*** YOUR CODE HERE ***"
            src.pop_first()
            return nil
        else:
            "*** YOUR CODE HERE ***"
            return Pair(src.pop_first(), read_tail(src))
    except EOFError:
        raise SyntaxError('unexpected end of file')
```

然后报了这样的错误

```python
>>> read_tail(Buffer(tokenize_lines(['(2)'])))
Pair('(', Pair(2, nil))

# Error: expected
#     SyntaxError
# but got
#     Pair('(', Pair(2, nil))
```

然后看到了题目中的

>   `read_tail`:
>
>   -   If none of the above cases apply, the next token is the operator in a combination, e.g. src contains `+ 2 3)`. To parse this:
>
>       1.  `scheme_read` the next complete expression in the buffer.
>
>           ...

于是明白如果在 `read_tail` 中读到左括号 `(` ，就意味着读到了嵌套的表达式，需要调用 `scheme_read` 来处理这个内层的表达式，因此改成了

```python
if src.current() == '(':
    return Pair(scheme_read(src), read_tail(src))
return Pair(src.pop_first(), read_tail(src))
```

再次测试，原来错误的地方通过了，但是出现了新的报错

```python
>>> read_line('(a)')
nil

# Error: expected
#     Pair('a', nil)
# but got
#     nil
```

进行分析，感觉上一个错误也和这个差不多，但是已经被解决，说明问题不在 `read_tail` 中，所以应该在 `scheme_read` 中，于是进行查看，发现这里已经弹出过*令牌*了

```python
val = src.pop_first() # Get and remove the first token
```

所以将之前的代码修改后，最后终于通过😭

::: details 代码
```python
def scheme_read(src):
    if src.current() is None:
        raise EOFError
    val = src.pop_first() # Get and remove the first token
    if val == 'nil':
        # BEGIN PROBLEM 1
        "*** YOUR CODE HERE ***"
        return nil
        # END PROBLEM 1
    elif val == '(':
        # BEGIN PROBLEM 1
        "*** YOUR CODE HERE ***"
        return read_tail(src)
        # END PROBLEM 1
    elif val == "'":
        # BEGIN PROBLEM 6
        "*** YOUR CODE HERE ***"
        # END PROBLEM 6
    elif val not in DELIMITERS:
        return val
    else:
        raise SyntaxError('unexpected token: {0}'.format(val))
def read_tail(src):
    try:
        if src.current() is None:
            raise SyntaxError('unexpected end of file')
        elif src.current() == ')':
            # BEGIN PROBLEM 1
            "*** YOUR CODE HERE ***"
            src.pop_first()
            return nil
            # END PROBLEM 1
        else:
            # BEGIN PROBLEM 1
            "*** YOUR CODE HERE ***"
            if src.current() == '(':
                return Pair(scheme_read(src), read_tail(src))
            return Pair(src.pop_first(), read_tail(src))
            # END PROBLEM 1
    except EOFError:
        raise SyntaxError('unexpected end of file')
```
:::

---

Problem 13中发现了 由于Problem 1中代码存在漏洞 而导致的错误，重新阅读题目后，将代码修改正确(具体可见于第7条Problem 13)

::: details 代码
```python
def scheme_read(src):
    if src.current() is None:
        raise EOFError
    val = src.pop_first() # Get and remove the first token
    if val == 'nil':
        # BEGIN PROBLEM 1
        "*** YOUR CODE HERE ***"
        return nil
        # END PROBLEM 1
    elif val == '(':
        # BEGIN PROBLEM 1
        "*** YOUR CODE HERE ***"
        return read_tail(src)
        # END PROBLEM 1
    elif val == "'":
        # BEGIN PROBLEM 6
        "*** YOUR CODE HERE ***"
        # END PROBLEM 6
    elif val not in DELIMITERS:
        return val
    else:
        raise SyntaxError('unexpected token: {0}'.format(val))
def read_tail(src):
    try:
        if src.current() is None:
            raise SyntaxError('unexpected end of file')
        elif src.current() == ')':
            # BEGIN PROBLEM 1
            "*** YOUR CODE HERE ***"
            src.pop_first()
            return nil
            # END PROBLEM 1
        else:
            # BEGIN PROBLEM 1
            "*** YOUR CODE HERE ***"
            return Pair(scheme_read(src), read_tail(src))
            # END PROBLEM 1
    except EOFError:
        raise SyntaxError('unexpected end of file')
```
:::

### 2

Problem 4，一开始我写的是

```python
operator = env.lookup(first)
validate_procedure(operator)
operands = rest.map(lambda x: env.lookup(x))
return scheme_apply(operator, operands, env)
```

但是报了这样的错误

```python
>>> from scheme_reader import *
>>> from scheme import *
>>> expr = read_line('(+ 2 2)')
>>> scheme_eval(expr, create_global_frame()) # Type SchemeError if you think this errors
Traceback (most recent call last):
  ...
scheme_builtins.SchemeError: unknown identifier: 2

# Error: expected
#     4
# but got
#     Traceback (most recent call last):
#       ...
#     SchemeError: unknown identifier: 2
```

然后突然想到 `2` 并不是一个 *符号 symbol* ，所以 `env.lookup(2)` 应该是会报错，然后又会想起题目中的

>   You'll have to recursively call `scheme_eval` in the first two steps.

所以就知道需要如何修改了，最后修改后通过了测试

::: details 代码
```python
def scheme_eval(expr, env, _=None): # Optional third argument is ignored
    # Evaluate atoms
    if scheme_symbolp(expr):
        return env.lookup(expr)
    elif self_evaluating(expr):
        return expr

    # All non-atomic expressions are lists (combinations)
    if not scheme_listp(expr):
        raise SchemeError('malformed list: {0}'.format(repl_str(expr)))
    first, rest = expr.first, expr.rest
    if scheme_symbolp(first) and first in SPECIAL_FORMS:
        return SPECIAL_FORMS[first](rest, env)
    else:
        # BEGIN PROBLEM 4
        "*** YOUR CODE HERE ***"
        operator = scheme_eval(first, env)
        validate_procedure(operator)
        operands = rest.map(lambda x: scheme_eval(x, env))
        return scheme_apply(operator, operands, env)
        # END PROBLEM 4
```

### 3

Problem 5，注意需要区分第二个操作数需要通过*求值*将符号或表达式变成对应值

::: details 代码
```python
def do_define_form(expressions, env):
    validate_form(expressions, 2) # Checks that expressions is a list of length at least 2
    target = expressions.first
    if scheme_symbolp(target):
        validate_form(expressions, 2, 2) # Checks that expressions is a list of length exactly 2
        # BEGIN PROBLEM 5
        "*** YOUR CODE HERE ***"
        env.define(target, scheme_eval(expressions.rest.first, env))
        return target
        # END PROBLEM 5
    ...
```
:::

### 4

Problem 6中，一开始在 `scheme_read` 中写的是

```python
return Pair("quote", scheme_read(src))
```

但是报错了

```python
scm> ''hello
hello str
# Error: cdr can only be a pair, nil, or a promise but was hello

# Error: expected
#     (quote hello)
# but got
#     Traceback (most recent call last):
#       ...
#     SchemeError: cdr can only be a pair, nil, or a promise but was hello
```

经过思考，大概理解了，我感觉 `'` 可以理解为**只会有一个参数/操作数的函数**(因为引号后只会有一个最外层的括号)，因此返回的结构就会是

```python
Pair("quote", Pair(..., nil))
```

`...` 就是被引用的部分，也就是那**唯一的参数**。

::: details 代码
::: code-group

```python [scheme.py]
def do_quote_form(expressions, env):
    validate_form(expressions, 1, 1)
    # BEGIN PROBLEM 6
    "*** YOUR CODE HERE ***"
    return expressions.first
    # END PROBLEM 6
```

```python [scheme_reader.py]
def scheme_read(src):
    ...
    elif val == "'":
        # BEGIN PROBLEM 6
        "*** YOUR CODE HERE ***"
        return Pair("quote", Pair(scheme_read(src), nil))
        # END PROBLEM 6
    ...
def read_tail(src):
    try:
        ...
        else:
            # BEGIN PROBLEM 1
            "*** YOUR CODE HERE ***"
            # if src.current() == '(':
            if src.current() in ('(', "'"):
                ...
            ...
            # END PROBLEM 1
    ...
```

:::

### 5

解锁Problem 8的这题答案(参考 `do_lambda_form` 函数说明可以得知是 `Pair(...)` 的形式)有些难敲(主要是因为太长了😅)

```python
>>> from scheme_reader import *
>>> from scheme import *
>>> env = create_global_frame()
>>> lambda_line = read_line("(lambda (a b c) (+ a (* b c)))")
>>> lambda_proc = do_lambda_form(lambda_line.rest, env)
>>> lambda_proc.formals
? Pair('a', Pair('b', Pair('c', nil)))
-- OK! --

>>> lambda_proc.body # Remember that the body is a *list* of expressions!
? Pair(Pair('+', Pair('a', Pair(Pair('*', Pair('b', Pair('c', nil))), nil))), nil)
-- OK! --
```

### 6

Problem 10，这题不难，但我用循环迭代实现了之后，突然想到 `Pair` 有 `map` 方法，所以突发奇想想用 `map` 来实现(利用 `map` 来获取 `Pair` 中所有的元素)

::: details 代码
::: code-group

```python [实现一]
class Frame(object):
    ...
    def make_child_frame(self, formals, vals):
        if len(formals) != len(vals):
            raise SchemeError('Incorrect number of arguments to function call')
        # BEGIN PROBLEM 10
        "*** YOUR CODE HERE ***"
        child = Frame(self)
        while formals is not nil:
            child.define(formals.first, vals.first)
            formals, vals = formals.rest, vals.rest
        return child
        # END PROBLEM 10
```

```python [实现二]
class Frame(object):
    ...
    def make_child_frame(self, formals, vals):
        if len(formals) != len(vals):
            raise SchemeError('Incorrect number of arguments to function call')
        # BEGIN PROBLEM 10
        "*** YOUR CODE HERE ***"
        child = Frame(self)
        formals_list, vals_list = [], []
        formals.map(lambda x: formals_list.append(x))
        vals.map(lambda x: vals_list.append(x))
        for formal, val in zip(formals_list, vals_list):
            child.define(formal, val)
        return child
        # END PROBLEM 10
```

:::

### 7

Problem 13不算复杂，但我写出来之后，报了一个错误

```python
scm> (cond ((= 1 1) nil))
# Error: unknown identifier: nil

# Error: expected
#     ()
# but got
#     Traceback (most recent call last):
#       ...
#     SchemeError: unknown identifier: nil
```

经过修改代码来查看错误地方的相关信息，进行到错误发生的地方前，打印 `clause.rest` 显示 `Pair('nil', nil)` ，这意味着是**在读取的时候没有读取正确**，于是回头查看Problem 1的 `scheme_read` 和 `read_tail` ，

而 `scheme_read` 中是有处理 `'nil'` 的相关代码的

```python
if val == 'nil':
    # BEGIN PROBLEM 1
    "*** YOUR CODE HERE ***"
    return nil
    # END PROBLEM 1
```

尝试直接运行scheme解释器进行测试

```bash
python scheme.py
```

发现直接输入 `nil` 时，能正确输出成空链表 `()` ，而**当 `nil` 被嵌套包含时，就不能被正常转换**，所以错误发生在 `read_tail` 中，

```scheme
scm> nil
()
scm> (+ nil)
Error: unknown identifier: nil
```

于是重新回去理解题目的说明

::: info 引述
`read_tail`:

-   If there are no more tokens, then the list is missing a close parenthesis and we should raise an error. **(provided)**
-   If the token is `)`, then we've reached the end of the list or pair. **Remove this token from the buffer** and return the `nil` object.
-   If none of the above cases apply, the next token is the operator in a combination, e.g. src contains `+ 2 3)`. To parse this:
    1.  `scheme_read` the next complete expression in the buffer.
    2.  Call `read_tail` to read the rest of the combination until the matching closing parenthesis.
    3.  Return the results as a `Pair` instance, where the first element is the next complete expression from (1) and the second element is the rest of the combination from (2).
:::

三个情况刚好对应所给的代码框架中的 `if-elif-else` 的三块代码，因此，根据题目的意思， `else` 处的代码应该为

```python
return Pair(scheme_read(src), read_tail(src))
```

测试Problem 1通过，再测试Problem 13，终于通过了😇

::: details 代码
```python
def do_cond_form(expressions, env):
    while expressions is not nil:
        clause = expressions.first
        validate_form(clause, 1)
        if clause.first == 'else':
            test = True
            if expressions.rest != nil:
                raise SchemeError('else must be last')
        else:
            test = scheme_eval(clause.first, env)
        if is_true_primitive(test):
            # BEGIN PROBLEM 13
            "*** YOUR CODE HERE ***"
            if clause.rest is nil:
                return test
            return eval_all(clause.rest, env)
            # END PROBLEM 13
        expressions = expressions.rest
```
:::

### 8

Problem 14中，需要注意 有可能要被赋值的符号对应的是一个表达式，所以需要进行*求值*

::: details 代码
```python
def make_let_frame(bindings, env):
    if not scheme_listp(bindings):
        raise SchemeError('bad bindings list in let form')
    names, values = nil, nil
    # BEGIN PROBLEM 14
    "*** YOUR CODE HERE ***"
    while bindings is not nil:
        binding = bindings.first
        validate_form(binding, 2, 2)
        names = Pair(binding.first, names)
        values = Pair(scheme_eval(binding.rest.first, env), values)
        bindings = bindings.rest
    validate_formals(names)
    # END PROBLEM 14
    return env.make_child_frame(names, values)
```
:::

### 9

Problem 16感觉蛮有意思

::: details 代码
```scheme
(define (merge comp list1 list2)
    ; BEGIN PROBLEM 16
    'replace-this-line
    (cond ((equal? list1 nil) list2)
        ((equal? list2 nil) list1)
        (else (let ((x (car list1)) (y (car list2)))
                    (if (comp x y)
                        (cons x (merge comp (cdr list1) list2))
                        (cons y (merge comp list1 (cdr list2)))))))
    )
    ; END PROBLEM 16
```
:::

---

Problem 17代码有点绕(难写，debug起来也痛苦😅)

::: details 代码
```scheme
(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    'replace-this-line
    (cond ((equal? s nil) nil)
            ((equal? (cdr s) nil) (list s))
            ((> (car s) (cadr s)) (cons (list (car s)) (nondecreaselist (cdr s))))
            (else (let ((rest (nondecreaselist (cdr s))))
                        (cons (cons (car s) (car rest)) (cdr rest)))))
    )
    ; END PROBLEM 17
```
:::

### 10

Extra Credit，这题有点难度😅(依次修改了好几次最终才全部通过)，

一开始我写出来

```scheme
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         (cons 'quote (cdr expr))
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
           (cons form (cons params body))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
           (let ((values (zip values)))
                (cons (cons 'lambda (cons (car values) body)) (cadr values)))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         'replace-this-line
         expr
         ; END PROBLEM EC
         )))
```

然后根据测试用例的错误，发现还需要递归地应用表达式，依次发现4个地方需要递归：

-   `(cons form (cons params body))` 的 `body` 
-   `(cons (cons 'lambda (cons (car values) body)) (cadr values)))` 的 `body` 和 `(cadr values)` 
-   最后的 `expr`

并且由于是很多个表达式，所以需要用到 `map` 函数

::: details 代码
```scheme
(define (let-to-lambda expr)
    (cond ((atom? expr)
            ; BEGIN PROBLEM EC
            'replace-this-line
            expr
            ; END PROBLEM EC
            )
        ((quoted? expr)
            ; BEGIN PROBLEM EC
            'replace-this-line
            (cons 'quote (cdr expr))
            ; END PROBLEM EC
            )
        ((or (lambda? expr)
                (define? expr))
            (let ((form   (car expr))
                (params (cadr expr))
                (body   (cddr expr)))
            ; BEGIN PROBLEM EC
            'replace-this-line
            (cons form (cons params (map let-to-lambda body)))
            ; END PROBLEM EC
            ))
        ((let? expr)
            (let ((values (cadr expr))
                (body   (cddr expr)))
            ; BEGIN PROBLEM EC
            'replace-this-line
            (let ((values (zip values)))
                (cons (cons 'lambda (cons (car values) (map let-to-lambda body))) (map let-to-lambda (cadr values))))
            ; END PROBLEM EC
            ))
        (else
            ; BEGIN PROBLEM EC
            'replace-this-line
            (map let-to-lambda expr)
            ; END PROBLEM EC
            )))
```
:::

### 11

Problem 11，这题题目我理解了好几遍最后才感觉算是完全理解正确

::: info 引述
Complete the function `optimize_tail_calls` in `scheme.py`. It returns an alternative to `scheme_eval` that is properly tail recursive. That is, the interpreter will allow an unbounded number of active [tail calls](http://en.wikipedia.org/wiki/Tail_call) in constant space.

The `Thunk` class represents a [thunk](http://en.wikipedia.org/wiki/Thunk), an expression that needs to be evaluated in an environment. When `scheme_optimized_eval` receives a non-atomic expression in a `tail` context, then it returns an `Thunk` instance. Otherwise, it should repeatedly call `prior_eval_function` until the result is a value, rather than a `Thunk`.

**A successful implementation will require changes to several other functions, including some functions that we provided for you.** All expressions throughout your interpreter that are in a tail context should be evaluated by calling `scheme_eval` with `True` as a third argument. Your goal is to determine which expressions are in a tail context throughout your code.

---

在 `scheme.py` 中完成 `optimize_tail_calls` 函数。它返回 `scheme_eval` 的一种替代方法，可以正确处理尾递归。也就是说，解释器将允许在常量空间内有无限数量的活动[尾调用](http://en.wikipedia.org/wiki/Tail_call)。

`Thunk` 类表示一个[thunk](http://en.wikipedia.org/wiki/Thunk)，即需要在环境中求值的表达式。当 `scheme_optimized_eval` 在 `尾` 上下文中接收到一个非原子表达式时，它将返回一个 `Thunk` 实例。否则，它应该反复调用 `prior_eval_function`，直到结果是一个值，而不是一个 `Thunk`。

**成功的实现将需要对其他几个函数进行更改，包括一些我们为您提供的函数。** 在整个解释器中，所有在尾上下文中的表达式都应通过调用带有 `True` 作为第三个参数的 `scheme_eval` 来进行求值。您的目标是确定代码中哪些表达式在尾上下文中。
:::

这题大概意思是，需要优化处理*求值*部分，对于 *尾递归 tail recursive* 的情况。

>   The `Thunk` class represents a [thunk](http://en.wikipedia.org/wiki/Thunk), an expression that needs to be evaluated in an environment. When `scheme_optimized_eval` receives a non-atomic expression in a `tail` context, then it returns an `Thunk` instance. Otherwise, it should repeatedly call `prior_eval_function` until the result is a value, rather than a `Thunk`.

这一段其实上我认为对应的就是提供的代码中的这个部分(non-atomic 刚好对应 `not scheme_symbolp(expr) and not self_evaluating(expr)` )

```python
if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
    return Thunk(expr, env)
```

>   All expressions throughout your interpreter that are in a tail context should be evaluated by calling `scheme_eval` with `True` as a third argument. Your goal is to determine which expressions are in a tail context throughout your code.

这句说的是，题目的关键就是需要找到/想到判断尾递归形式/格式的方法，并进行对应的处理。

最后就是这一句，

>   **A successful implementation will require changes to several other functions, including some functions that we provided for you.**

是说最终的实现还会需要修改一些函数，包括提供的函数，所以这意味着这题非常开放，很难，我尝试了很久也没有尝试出来。

最后看到 Lecture 35 和 36 刚好就是 Tail calls 和 Macros ，刚好分别对应19和20题，然后去看了一下lecture 35，发现课上有讲解这一题，所以就先跳过这一题了。(发现20题也需要用到tail call，所以也跳过了)

### 12

看完了所有课程之后继续尝试完成之前没有完成的题目，

Problem 20 *宏 macro*，这题不算特别复杂，按照题目中说的，实现 `do_define_macro` 函数创建一个 `MacroProcedure` 类，再修改一下 `scheme_eval` 就行了，

`do_define_macro` 中的代码基本上可以参考 `do_define_form` 的代码，

`scheme_eval` 中，需要调用 `MacroProcedure` 的 `apply_macro` 方法，并不先*求值*而是直接传入参数的原始表达式，一开始我写的是

```python
return operator.apply_macro(rest, env)
```

但测试时显示这里返回的是

```scheme
scm> (for i '(1 2 3)
....      (if (= i 1)
....          0
....          i))
(map (lambda (i) (if (= i 1) 0 i)) (quote (1 2 3)))

# Error: expected
#     (0 2 3)
# but got
#     (map (lambda (i) (if (= i 1) 0 i)) (quote (1 2 3)))
```

所以最后再添加一个 `scheme_eval` 函数就可以了

::: details 代码
```python
def do_define_macro(expressions, env):
    # BEGIN Problem 20
    "*** YOUR CODE HERE ***"
    validate_form(expressions, 2)
    target = expressions.first
    if isinstance(target, Pair) and scheme_symbolp(target.first):
        name = target.first
        formals = target.rest
        validate_formals(formals)
        value = MacroProcedure(formals, expressions.rest, env)
        env.define(name, value)
        return name
    else:
        bad_target = target.first if isinstance(target, Pair) else target
        raise SchemeError("non-symbol: {0}".format(bad_target))
    # END Problem 20
```

```python
def scheme_eval(expr, env, _=None): # Optional third argument is ignored
    ...
    else:
        ...
        validate_procedure(operator)
        if isinstance(operator, MacroProcedure):
            return scheme_eval(operator.apply_macro(rest, env), env)
        ...
```
:::

### 13

Problem 19，做这题花了好久时间，也尝试了好多次。

>   需要注意的是，题目中有一处写的是 `prior_eval_function` ，这里可能是忘记进行修改(20年夏季的scheme project对应的代码是 `prior_eval_function` )，应该对应的是代码中的 `original_scheme_eval`

刚开始是觉得需要在 `optimized_eval` 中进行是否是尾(调用)格式(in tail context)的判断，于是在函数中编写

```python
def in_tail_context(expr):
    if isinstance(expr, Pair) and scheme_symbolp(expr.first):
        first = expr.first
        if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
            return True
        elif first == "if":
            sub_expr_2 = expr.rest.rest.first
            sub_expr_3 = expr.rest.rest.rest.first
            return in_tail_context(sub_expr_2) or in_tail_context(sub_expr_3)
        else:
            return False
    else:
        return False
```

因为在lecture 35 Tail Calls里，John说只需要注意 最后的表达式是调用lambda函数 和 `if` 表达式 这两种情况，

![cs61a_202](../images/cs61a_202.png){ loading=lazy }

所以我就只对这两种情况进行了判断。

然后，我的想法是，如果不符合尾格式，就使用原始的eval函数，如果符合的话，那么就应该是会得到 `Thunk` 类实例，那么应该循环进行求值(就不会递归溢出)，于是

```python
def optimize_tail_calls(original_scheme_eval):
    def optimized_eval(expr, env, tail=False):
        if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
            return Thunk(expr, env)

        result = Thunk(expr, env)
        # BEGIN PROBLEM 19
        "*** YOUR CODE HERE ***"
        def in_tail_context(expr):
            ...
        
        if not in_tail_context(expr):
            return original_scheme_eval(expr, env)
            
        while isinstance(result, Thunk):
            result = original_scheme_eval(result.expr, result.env)
        return result
        # END PROBLEM 19
    return optimized_eval
```

这里想到要用 `while` 循环，是因为原始的代码中有 `result = Thunk(expr, env)` 感觉很像是需要循环进行计算最后得到不是 `Thunk` 的 `result` 。

但测试发现不行，

然后捋了一下代码的流程，感觉应该是需要在**某个自定义的尾递归(或者说body符合尾格式)的函数返回body时返回 `Thunk`** (所以为了运行这个函数之前的调用的eval和apply等函数就可以返回这个 `Thunk` 因此就不会溢出)，然后这个 `Thunk` 在 `optimized_eval` 中被循环*求值*，

所以觉得判断尾格式应该是在 `scheme_apply` 调用的 `eval_all` 中，于是将代码修改成了

```python
def eval_all(expressions, env):
    def in_tail_context(expr):
        ...
    
    result = None
    while expressions.rest is not nil:
        result = scheme_eval(expressions.first, env)
        expressions = expressions.rest
    result = scheme_eval(expressions.first, env, tail=in_tail_context(expressions.first))
    return result
```

进行测试发现不行，

>   ```scheme
>   scm> (define (sum n total)
>   ....   (if (zero? n)
>   ....       total
>   ....       (sum (- n 1) (+ n total))))
>   sum
>   scm> (sum 1001 0)
>   ```

然后想到是由于每次进入最后的 `sum` 时，都会新调用一个eval，所以就会递归溢出，

于是想到了在 `optimized_eval` 中直接处理这两种情况，

```python
while isinstance(result, Thunk):
    if result.expr.first == "if":
        result = do_if_form(result.expr.rest, result.env, in_tail=True)
    else:
        result = original_scheme_eval(result.expr, result.env)
```

并且对 `do_if_form` 进行修改

```python
def do_if_form(expressions, env, in_tail=False):
    validate_form(expressions, 2, 3)
    if is_true_primitive(scheme_eval(expressions.first, env)):
        return scheme_eval(expressions.rest.first, env, tail=in_tail)
    elif len(expressions) == 3:
        return scheme_eval(expressions.rest.rest.first, env, tail=in_tail)
```

>   添加 `in_tail` 参数是因为，需要在这里就返回 `Thunk` 类，否则还是会形成递归

然后进行测试，发现竟然真的能通过几个测试用例😮，但没全部通过，

但是感觉这样的思路(在 `eval_all` 中进行尾格式的判断)应该可以通过测试，于是将 `optimized_eval` 改成了

```python
def optimized_eval(expr, env, tail=False):
    if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
        return Thunk(expr, env)

    result = Thunk(expr, env)
    # BEGIN PROBLEM 19
    "*** YOUR CODE HERE ***"
    result = original_scheme_eval(expr, env)

    while isinstance(result, Thunk):
        rest_expr, env = result.expr.rest, result.env
        if result.expr.first == "if":
            result = do_if_form(rest_expr, env, in_tail=True)
        else:
            result = original_scheme_eval(result.expr, env)
    return result
    # END PROBLEM 19
```

然后测试发现只通过了两个例子，被卡在了第3个例子上，这个例子使用了 `cond` ，所以需要对这种情况进行处理，

于是修改 `eval_all` 中的 `in_tail_context` 

```python
def in_tail_context(expr):
    if not isinstance(expr, Pair):
        return True

    if isinstance(expr, Pair) and scheme_symbolp(expr.first):
        first = expr.first
        if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
            return True
        elif first == "if":
            sub_expr_2 = expr.rest.rest.first
            sub_expr_3 = expr.rest.rest.rest.first
            return in_tail_context(sub_expr_2) and in_tail_context(sub_expr_3)
        elif first == "cond":
            non_preds = []
            cond_expr = expr.rest
            while cond_expr is not nil:
                non_pred = True
                sub_expr = cond_expr.first
                while sub_expr.rest is not nil:
                    non_pred = sub_expr.rest.first
                    sub_expr = sub_expr.rest
                non_preds += [non_pred]
                cond_expr = cond_expr.rest
            return all([in_tail_context(x) for x in non_preds])
        else:
            return False
    else:
        return False
```

然后发现，可能是由于 `do_cond_form` 中最后调用的是 `eval_all` (其中有判断尾形式的代码)所以就可以使用原本的eval来处理 `cond` 的情况，

然后测试被第5个例子 `let` 语句卡住，于是继续在 `in_tail_context` 中添加判断的情况，

```python
def in_tail_context(expr):
    ...
    if isinstance(expr, Pair) and scheme_symbolp(expr.first):
        first = expr.first
        if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
            ...
        elif first == "let":
            # return True
            let_expr = expr.rest.rest
            while let_expr.rest is not nil:
                let_expr = let_expr.rest
            return in_tail_context(let_expr.first)
        else:
            return False
    else:
        return False
```

再测试，被第6个例子 `or` 和 `and` 卡住，

然后看了一下之前的ppt，`and` `or` `begin` 的情况差不多，所以就一起判断了

```python
def in_tail_context(expr):
    ...
    if ...:
        ...
        elif first in ("and", "or", "begin"):
            return True
        else:
            return False
    else:
        return False
```

然后对应在 `do_and_form` 和 `do_or_form` 中进行修改

>   `do_begin_form` 由于和之前的 `do_cond_form` 一样最后调用的是 `eval_all` 所以就不用修改

```python
def do_and_form(expressions, env, in_tail=False):
    result = "#t"
    while expressions is not nil:
        if not isinstance(expressions.first, Pair):
            result = scheme_eval(expressions.first, env)
        elif in_tail and scheme_symbolp(expressions.first.first):
            first = expressions.first.first
            if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
                result = scheme_eval(expressions.first, env, tail=True)
            else:
                result = scheme_eval(expressions.first, env)
        else:
            result = scheme_eval(expressions.first, env)

        if is_false_primitive(result) or isinstance(result, Thunk):
            break
        expressions = expressions.rest
    return result

def do_or_form(expressions, env, in_tail=False):
    result = "#f"
    while expressions is not nil:
        if not isinstance(expressions.first, Pair):
            result = scheme_eval(expressions.first, env)
        elif in_tail and scheme_symbolp(expressions.first.first):
            first = expressions.first.first
            if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
                result = scheme_eval(expressions.first, env, tail=True)
            else:
                result = scheme_eval(expressions.first, env)
        else:
            result = scheme_eval(expressions.first, env)

        if is_true_primitive(result) or isinstance(result, Thunk):
            break
        expressions = expressions.rest
    return result
```

最后在 `optimized_eval` 中

```python
def optimized_eval(expr, env, tail=False):
    ...
    # BEGIN PROBLEM 19
    "*** YOUR CODE HERE ***"
    result = original_scheme_eval(expr, env)
    while isinstance(result, Thunk):
        rest_expr, env = result.expr.rest, result.env
        if result.expr.first in ("if", "and", "or"):
            result = SPECIAL_FORMS[result.expr.first](rest_expr, env, in_tail=True)
        else:
            result = original_scheme_eval(result.expr, env)
    return result
```

最后测试，终于全部通过了😭，总算是全部完成了这个project

::: details 代码
```python{9-16}
def optimize_tail_calls(original_scheme_eval):
    def optimized_eval(expr, env, tail=False):
        if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
            return Thunk(expr, env)

        result = Thunk(expr, env)
        # BEGIN PROBLEM 19
        "*** YOUR CODE HERE ***"
        result = original_scheme_eval(expr, env)
        while isinstance(result, Thunk):
            rest_expr, env = result.expr.rest, result.env
            if result.expr.first in ("if", "and", "or"):
                result = SPECIAL_FORMS[result.expr.first](rest_expr, env, in_tail=True)
            else:
                result = original_scheme_eval(result.expr, env)
        return result
        # END PROBLEM 19
    return optimized_eval
```

```python{11-45,47-48,50-51,53}
def eval_all(expressions, env):
    # BEGIN PROBLEM 7
    # return scheme_eval(expressions.first, env) # replace this with lines of your own code

    # result = None
    # while expressions is not nil:
    #     result = scheme_eval(expressions.first, env)
    #     expressions = expressions.rest
    # return result

    def in_tail_context(expr):
        if not isinstance(expr, Pair):
            return True

        if isinstance(expr, Pair) and scheme_symbolp(expr.first):
            first = expr.first
            if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
                return True
            elif first == "if":
                sub_expr_2 = expr.rest.rest.first
                sub_expr_3 = expr.rest.rest.rest.first
                return in_tail_context(sub_expr_2) and in_tail_context(sub_expr_3)
            elif first == "cond":
                non_preds = []
                cond_expr = expr.rest
                while cond_expr is not nil:
                    non_pred = True
                    sub_expr = cond_expr.first
                    while sub_expr.rest is not nil:
                        non_pred = sub_expr.rest.first
                        sub_expr = sub_expr.rest
                    non_preds += [non_pred]
                    cond_expr = cond_expr.rest
                return all([in_tail_context(x) for x in non_preds])
            elif first == "let":
                let_expr = expr.rest.rest
                while let_expr.rest is not nil:
                    let_expr = let_expr.rest
                return in_tail_context(let_expr.first)
            elif first in ("and", "or", "begin"):
                return True
            else:
                return False
        else:
            return False

    if expressions is nil:
        return
    result = None
    while expressions.rest is not nil:
        result = scheme_eval(expressions.first, env)
        expressions = expressions.rest
    result = scheme_eval(expressions.first, env, tail=in_tail_context(expressions.first))
    return result
    # END PROBLEM 7
```

```python{1-2,4,6}
def do_if_form(expressions, env, in_tail=False):
    validate_form(expressions, 2, 3)
    if is_true_primitive(scheme_eval(expressions.first, env)):
        return scheme_eval(expressions.rest.first, env, tail=in_tail)
    elif len(expressions) == 3:
        return scheme_eval(expressions.rest.rest.first, env, tail=in_tail)
```

```python{1,11-23,28,38-50}
def do_and_form(expressions, env, in_tail=False):
    # BEGIN PROBLEM 12
    "*** YOUR CODE HERE ***"
    result = "#t"
    while expressions is not nil:
        # result = scheme_eval(expressions.first, env)
        # if is_false_primitive(result):
        #     return result
        # expressions = expressions.rest

        if not isinstance(expressions.first, Pair):
            result = scheme_eval(expressions.first, env)
        elif in_tail and scheme_symbolp(expressions.first.first):
            first = expressions.first.first
            if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
                result = scheme_eval(expressions.first, env, tail=True)
            else:
                result = scheme_eval(expressions.first, env)
        else:
            result = scheme_eval(expressions.first, env)

        if is_false_primitive(result) or isinstance(result, Thunk):
            break
        expressions = expressions.rest
    return result
    # END PROBLEM 12

def do_or_form(expressions, env, in_tail=False):
    # BEGIN PROBLEM 12
    "*** YOUR CODE HERE ***"
    result = "#f"
    while expressions is not nil:
        # result = scheme_eval(expressions.first, env)
        # if is_true_primitive(result):
        #     return result
        # expressions = expressions.rest

        if not isinstance(expressions.first, Pair):
            result = scheme_eval(expressions.first, env)
        elif in_tail and scheme_symbolp(expressions.first.first):
            first = expressions.first.first
            if first not in SPECIAL_FORMS and isinstance(env.lookup(first), LambdaProcedure):
                result = scheme_eval(expressions.first, env, tail=True)
            else:
                result = scheme_eval(expressions.first, env)
        else:
            result = scheme_eval(expressions.first, env)

        if is_true_primitive(result) or isinstance(result, Thunk):
            break
        expressions = expressions.rest
    return result
    # END PROBLEM 12
```
:::
