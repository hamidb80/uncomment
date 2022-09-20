import macros, strutils

const
  uncommentPrefix {.strdefine.} = ">> "
  uncommentPrefixDebug {.used.} = "?? "

proc unCommentResolver(prefix: string, body: NimNode) =
  for i, node in body.pairs:
    if node.kind == nnkCommentStmt:
      body[i] = newstmtlist()

      for text in node.strval.splitLines:
        let
          code = strip text
          a = code.startswith prefix
          b = code.startswith uncommentPrefixDebug

        body[i].add:
          when not defined(release) and not defined(danger):
            if a or b:
              parsestmt code[prefix.len..^1]
            else:
              newCommentStmtNode(code)

          else:
            if a: parsestmt code[prefix.len..^1]
            else: newCommentStmtNode(code)

    elif body.len > 0:
      unCommentResolver prefix, node

macro uncomment*(body: untyped) =
  unCommentResolver uncommentPrefix, body
  return body

macro uncommentWith*(prefix: static[string], body: untyped) =
  unCommentResolver prefix, body
  return body
