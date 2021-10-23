import unittest, macros, strutils
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
  ## >> add(res, "No ...")
  ## !! add(res, "Yay")
  ## !! add(res, "it works")
  ## >> add(res, "Not again")
  ## !! add(res, "end")

# ------------------------------
macro getBodyRepr(p: typed): untyped=
  return newStrLitNode repr p.getImpl[^1]

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

  check getBodyRepr(multiline).strip == """
  ## >> add(res, "No ...")
  add(res, "Yay")
  add(res, "it works")
  ## >> add(res, "Not again")
  add(res, "end")
  """.unindent(2).strip
