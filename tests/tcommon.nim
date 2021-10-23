import unittest
import uncomment

proc nested(res: var seq[string]){.uncomment.}=
  ## !! res.add "first"
  if true:
    ## !! res.add "2"

  discard 1 + 1
  if true:
    if true:
      ## !! res.add "even nested"

  ## >> res.add "NO"
  ## !! res.add "AMAZING"

proc multiline(res: var seq[string]){.uncomment.} =
  ## >> res.add "No ..."
  ## !! res.add "Yay"
  ## !! res.add "it works"
  ## >> res.add "Not again"
  ## !! res.add "end"


test "mulitline":
  var stemp: seq[string]
  
  multiline(stemp)
  check stemp == [
    "Yay",
    "it works",
    "end"
  ]

test "nested":
  var stemp: seq[string]
  
  nested(stemp)
  check stemp ==  [
    "first",
    "2",
    "even nested",
    "AMAZING",
  ]
