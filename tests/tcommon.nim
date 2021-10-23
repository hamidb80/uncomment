import unittest
import uncomment

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

proc multiline(res: var seq[string]){.uncomment.} =
  ## !! res.add "Yay"
  ## !! res.add "it works"
  ## >> res.add "No ...


test "mulitline":
  var stemp: seq[string]
  
  multiline(stemp)
  check stemp == ["Yay","it works"]

test "nested":
  var stemp: seq[string]
  
  nested(stemp)
  check stemp ==  [
    "first",
    "2",
    "AMAZING",
    "even nested",
  ]
