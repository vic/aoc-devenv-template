# Template for starting Advent Of Code using Nix devenv.

* [Install Nix](https://github.com/DeterminateSystems/nix-installer)

* Enable the [Languages](https://devenv.sh/languages/#supported-languages) you are using
  by editing `flakeModules/default.nix`. 

  You can also add unlisted languages if they package is available at [nixpkgs](https://search.nixos.org/packages).
  There's also an example of a custom language derivation (see `flakeModules/flix`).

* Enter the environment.

  If you have [direnv](https://direnv.net/docs/hook.html) already installed, this repo
  includes an `.envrc` file to load the default devenv. Otherwise you might want to run:
  `nix develop --impure`.


* Use the [aoc-cli](https://github.com/scarvalhojr/aoc-cli/) to retrieve and submit your puzzles.

  Login at [adventofcode.com](https://adventofcode.com/) and download the value of your `session` cookie  to `~/.adventofcode.session`.

  Use `aoc calendar` to confirm you can use the API.


* Start coding a puzzle.

  Use `just init <lang> <day>` to create language project for that day puzzle. 
  e.g. `just init rust 1` will create a rust project under `day1/rust` and provide the puzzle input.


* Get fun.

  Use `just watch <lang> <day>` to run your project on changes.

  


