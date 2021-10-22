import unittest
import uncomment

proc t1(res: var seq[string]){.uncommentWith: ">> ".} =
  ## >> res.add "first"
  ## >> res.add "2"
  discard 1 + 1
  ## << res.add "NO
  ## >> res.add "AMAZING"

  if true:
    ## >> res.add "even nested"


proc t2(res: var seq[string]){.uncommentWith: "<< ".} =
  ## >> res.add "NO"
  ## << res.add "YES"



test "e2e":
  var stemp: seq[string]
  
  t1(stemp)
  check stemp ==  [

    "first",
    "2",
    "AMAZING",
    "even nested",
  ]

  stemp.setLen 0
  t2(stemp)
  check stemp == ["YES"]
