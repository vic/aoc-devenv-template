[private]
help:
  just -l

[private]
tool LANG:
  #!/usr/bin/env sh
  case "{{LANG}}" in
   rust) echo cargo run ;;
   scala) echo scala-cli run . ;;
   flix) echo flix run ;;
   zig) echo zig run ;;
   *) echo false ;;
  esac  

[private]
new LANG:
  #!/usr/bin/env sh
  case "{{LANG}}" in
   rust) echo cargo init;;
   scala) echo touch main.scala;;
   flix) echo flix init ;;
   zig) echo zig init-exe;;
   *) echo false ;;
  esac  

init LANG DAY:
  #!/usr/bin/env sh
  mkdir -p day{{DAY}}/{{LANG}}
  cd day{{DAY}}/{{LANG}}
  $(just new {{LANG}})
  aoc download --day {{DAY}}

run LANG DAY:
  cd day{{DAY}}/{{LANG}} && $(just -q tool {{LANG}})

watch LANG DAY:
  watchexec --watch day{{DAY}}/{{LANG}} --workdir day{{DAY}}/{{LANG}} --restart --clear reset $(just -q tool {{LANG}})
  

