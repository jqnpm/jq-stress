<p align="center">
  <img src="https://rawgit.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg" alt="jqnpm logotype, a Penrose triangle" width="100" />
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
```



---

## License
Copyright (c) 2015 Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-stress**, comply to the MIT license. Please see the LICENSE file for details.
