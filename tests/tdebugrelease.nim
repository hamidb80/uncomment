import unittest
import uncomment


proc multilineDebug(res: var seq[string]){.uncomment.} =
  ## >> add(res, "Yay")
  ## >> add(res, "it works")
  ## ?? add(res, "but without `??` pref")
  ## >> add(res, "end")

# ------------------------------

test "?? in release build":
  var stemp: seq[string]
  
  multilineDebug(stemp)
  check stemp == [
    "Yay",
    "it works",
    "end"
  ]
