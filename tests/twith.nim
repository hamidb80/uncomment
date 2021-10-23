import unittest
import uncomment

proc simple(res: var seq[string]){.uncommentWith: "<< ".} =
  ## << res.add "YES"
  ## ++ res.add "NO"
  ## << res.add "yes"


test "basic":
  var stemp: seq[string]
  simple(stemp)
  check stemp == ["YES", "yes"]

