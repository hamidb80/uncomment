import unittest
import uncomment


proc multilineDebug(res: var seq[string]){.uncomment.} =
  ## >> add(res, "Yay")
  ## >> add(res, "it works")
  ## ?? add(res, "even with `??` pref")
  ## >> add(res, "end")

# ------------------------------

test "?? in debug build":
  var stemp: seq[string]
  
  multilineDebug(stemp)
  check stemp == [
    "Yay",
    "it works",
    "even with `??` pref",
    "end"
  ]
