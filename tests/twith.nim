import unittest
import uncomment

proc simple(res: var seq[string]){.uncommentWith: "<< ".} =
  ## ++ res.add "NO"
  ## << res.add "YES"

proc nested(res: var seq[string]){.uncommentWith: "<< ".} =
  ## << res.add "first"
  if true:
    ## << res.add "2"

  discard 1 + 1
  if true:
    if true:
      ## << res.add "AMAZING"

  ## >> res.add "NO
  ## << res.add "even nested"


test "basic":
  var stemp: seq[string]
  simple(stemp)
  check stemp == ["YES"]


test "nested":
  var stemp: seq[string]
  
  nested(stemp)
  check stemp ==  [
    "first",
    "2",
    "AMAZING",
    "even nested",
  ]
