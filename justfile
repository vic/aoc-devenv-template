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
scala-new DAY:
  #!/usr/bin/env sh
  cat <<-EOF > day{{DAY}}/scala/Main.scala
  package aoc.day{{DAY}}
  object Main extends App { println("Hello day{{DAY}}") }
  EOF

[private]
new LANG DAY:
  #!/usr/bin/env sh
  case "{{LANG}}" in
   rust) 
     cargo init --name "day{{DAY}}"
   ;;
   scala) 
     just -q scala-new {{DAY}}
   ;;
   flix) 
     flix init 
   ;;
   zig) 
     zig init-exe
   ;;
   *) false ;;
  esac  

init LANG DAY:
  #!/usr/bin/env sh
  mkdir -p day{{DAY}}/{{LANG}}
  aoc download --day {{DAY}} --overwrite --input-file day{{DAY}}/{{LANG}}/input.txt --puzzle-file day{{DAY}}/README.md
  cd day{{DAY}}/{{LANG}}
  just -q new {{LANG}} {{DAY}}

run LANG DAY:
  cd day{{DAY}}/{{LANG}} && $(just -q tool {{LANG}})

watch LANG DAY:
  watchexec --watch day{{DAY}}/{{LANG}} --workdir day{{DAY}}/{{LANG}} --restart --clear reset $(just -q tool {{LANG}})
  

