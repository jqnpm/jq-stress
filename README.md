<p align="center">
  <a href="https://github.com/joelpurra/jqnpm"><img src="https://raw.githubusercontent.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg?sanitize=true" alt="jqnpm logotype, a Penrose triangle" width="100" border="0" /></a>
</p>

# [jq-stress](https://github.com/joelpurra/jq-stress)

Manipulate strings without stress.

This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package in your jq project/package directory with [`jqnpm`](https://github.com/joelpurra/jqnpm):

```bash
jqnpm install joelpurra/jq-stress
```



## Usage


```jq
import "joelpurra/jq-stress" as Stress;

# Stress::remove(str)
"Hello World!" | Stress::remove(" World!")                # "Hello"

# Stress::replace(str; replacement)
"Hello World!" | Stress::replace("World"; "Beautiful")    # "Hello Beautiful!"

# Stress::reverse
# Note: does not, just like 'jq', take Unicode combining marks and astral symbols into account.
"Hello World!" | Stress::reverse    # "!dlroW olleH"

Stress::isEmpty
"" | Stress::isEmpty # true
"a" | Stress::isEmpty # false

Stress::isEmpty(fallback)
"" | Stress::isEmpty("omg") # "omg"
"a" | Stress::isEmpty("omg") # "a"

Stress::isNullOrEmpty
null | Stress::isNullOrEmpty # true
"" | Stress::isNullOrEmpty # true
"a" | Stress::isNullOrEmpty # false

Stress::isNullOrEmpty(fallback)
null | Stress::isNullOrEmpty("omg") # "omg"
"" | Stress::isNullOrEmpty("omg") # "omg"
"a" | Stress::isNullOrEmpty("omg") # "a"

Stress::isNullOrWhitespace
null | Stress::isNullOrWhitespace # true
"" | Stress::isNullOrWhitespace # true
" \\\\u0009\\\\u000B" | Stress::isNullOrWhitespace # true
"a" | Stress::isNullOrWhitespace # false

Stress::isNullOrWhitespace(fallback)
null | Stress::isNullOrWhitespace("omg") # "omg"
"" | Stress::isNullOrWhitespace("omg") # "omg"
" \\\\u0009\\\\u000B" | Stress::isNullOrWhitespace("omg") # "omg"
"a" | Stress::isNullOrWhitespace("omg") # "a"
```


## Todo

- Fix Unicode combining marks and astral symbols reversing with code from Mathias Bynens' [`esrever`](https://github.com/mathiasbynens/esrever).



---

## License
Copyright (c) 2015 Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-stress**, comply to the MIT license. Please see the LICENSE file for details.
