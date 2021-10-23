import unittest
import uncomment

proc simple(res: var seq[string]){.uncommentWith: "<< ".} =
  ## ++ res.add "NO"
  ## << res.add "YES"


test "basic":
  var stemp: seq[string]
  simple(stemp)
  check stemp == ["YES"]

