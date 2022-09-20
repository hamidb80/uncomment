import macros, strutils, sequtils

const
  uncommentPrefix {.strdefine.} = ">> "
  uncommentPrefixDebug {.used.} = "?? "

proc unCommentResolver(prefix: string, body: NimNode) =
  for i, node in body.pairs:
    if node.kind == nnkCommentStmt:
      let codes = node.strval.splitLines().mapIt it.strip
      body[i] = newstmtlist()

      for code in codes:
        body[i].add:
          when not defined(release) and not defined(danger):
            if (code.startswith prefix) or (code.startswith uncommentPrefixDebug):
              parsestmt code[prefix.len..^1]
            else: newCommentStmtNode(code)
          else:
            if code.startswith prefix: parsestmt code[prefix.len..^1]
            else: newCommentStmtNode(code)

    elif body.len > 0:
      unCommentResolver prefix, node

macro uncomment*(body: untyped) =
  unCommentResolver uncommentPrefix, body
  return body

macro uncommentWith*(prefix: static[string], body: untyped) =
  unCommentResolver prefix, body
  return body
