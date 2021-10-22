import macros, strutils, sequtils

const uncommentPrefix {.strdefine.} = ">> "

proc unCommentResolver(prefix: string, body: NimNode) =
  for i, node in body.pairs:
    if node.kind == nnkCommentStmt:
      let codes = node.strval.splitLines().mapIt it.strip
      var firstTime = true

      for code in codes:
        if code.startswith prefix:
          if firstTime:
            body[i] = newstmtlist()
            firstTime = false
            
          body[i].add parsestmt code[prefix.len..^1]

    elif body.len > 0:
      unCommentResolver prefix, node

macro uncomment*(body: untyped) =
  unCommentResolver uncommentPrefix, body
  return body

macro uncommentWith*(prefix: static[string], body: untyped) =
  unCommentResolver prefix, body
  return body