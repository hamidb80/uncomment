import unittest
import uncomment

proc t3(res: var seq[string]){.uncomment.} =
  ## !! res.add "Yay"
  ## !! res.add "it works"
  ## >> res.add "No ...

test "common prefix + mulitline":
  var stemp: seq[string]
  
  t3(stemp)
  check stemp == ["Yay","it works"]