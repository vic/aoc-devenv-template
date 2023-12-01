help:
  just -l

rust DAY:
  just run {{DAY}} rust "cargo run"

rust-watch DAY:
  just watch {{DAY}} rust "cargo run"

zig DAY:
  just run {{DAY}} zig "zig run"

zig-watch DAY:
  just watch {{DAY}} zig "zig run"

scala DAY:
  just run {{DAY}} scala "scala-cli run ."

scala-watch DAY:
  just watch {{DAY}} scala "scala-cli run ."

flix DAY:
  just run {{DAY}} flix "flix run"

flix-watch DAY:
  just watch {{DAY}} flix "flix run"

run DAY LANG TOOL:
  cd day{{DAY}}/{{LANG}} && {{TOOL}}

watch DAY LANG TOOL:
  watchexec --watch day{{DAY}}/{{LANG}} --workdir day{{DAY}}/{{LANG}} --restart --clear reset {{TOOL}}
  

