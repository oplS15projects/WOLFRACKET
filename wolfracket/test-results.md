# WOLFRACKET
### A Racket Mathematics and Graphing REST API

## Web server test
### server-handler.rkt

```
jose@ubuntu:~/Github/WOLFRACKET/wolfracket/lib$ racket driver.rkt

(process:8213): GLib-CRITICAL **: g_slice_set_config: assertion 'sys_page_size == 0' failed
Your Web application is running at http://localhost:8080.
Stop this program at any time to terminate the Web Server.
```

## Multiple Landing Pages associate to the API methods
### api.rkt

localhost:8080/home

```
Racket Mathematics and Graphing API Project Page
```

localhost:8080/api

```
Racket Mathematics and Graphing API Project Documentation Page
```

localhost:8080/api/add

```
Addition method
```

localhost:8080/not-a-valid-page
```
Resource not found.
```

localhost:8080/api/not-a-valid-page
```
API Resource not found.
```

## Mathematical operations
### math.rkt

```
(((my_math) 'add) 1 2)
```

3

```
(((my_math) 'subtract) 1 2)
```

-1

```
(((my_math) 'exponent) 1 2)
```

1

```
(((my_math) 'prime_check) 1)
```
false (here is wrong result)

```
(((my_math) 'divide) 1 2)
```

1/2

```
(((my_math) 'factorials) 12)
```

479001600
(here is wrong result)

```
(((my_math) 'sinus) 2)
```

3.626860407847019
