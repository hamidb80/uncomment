# Package

version       = "0.0.3"
author        = "hamidb80"
description   = "uncomment the codes at the compile time"
license       = "MIT"
srcDir        = "src"


task test, "test the app":
  exec "nim r ./tests/twith.nim"
  exec "nim -d:uncommentPrefix=\"!! \" r tests/tcommon.nim"
  exec "nim r ./tests/tdebug.nim"
  exec "nim r ./tests/tdebugrelease.nim"

# Dependencies
requires "nim >= 1.4.8"
