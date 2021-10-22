# Package

version       = "0.0.1"
author        = "hamidb80"
description   = "comment the codes that you don't wanna see"
license       = "MIT"
srcDir        = "src"


task test, "test the app":
  exec "nim r ./tests/twith.nim"
  exec "nim -d:uncommentPrefix=\"!! \" r tests/tcommon.nim"

# Dependencies
requires "nim >= 1.4.8"
