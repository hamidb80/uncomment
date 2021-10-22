## About
comment any code that you don't wanna see,
the code will be uncommented at the compile time!

## Philosophy:
probably sometimes you faced with something like this:

```nim
proc admin_page(...)=
  
  ...
  
  logger.info fmt"user {...} logged in"
  
  ...

  logger.info fmt"user {...} uploaded a virus"

  ...

  try:
    ...
  except:
    loggner.debug fmt"user {...} wanted to do ... but failed because of {getCurrentErrorMsg()}"

```

as you can see, there maybe a lot of line that *just logs* what happens in the system, this might distract you from the actual logic.

what if you could comment that lines of codes [well the point is the commented codes become less distractive thanks to the syntax-highlighting], and more focus on the actual logic?

well thanks to the powerful macro system [and me 😎] you can do this!


## Usage
NOTE: use `##` with prefix and not `#`

### static prefix
- usage: `{.uncomment.}`

set `uncommentPrefix` constant using `-d:uncommentPrefix="!! "`.
the default value is `">> "`.

```nim
proc your_Very_Special_Proc(...){.uncomment.}=
  ## >> echo "hey!"
  ...
  ## >> echo "hey again!"

```


### custom prefix for every proc
- usage: `{.uncommentWith: "...".}`

```nim
proc your_Very_Special_Proc(...){.uncommentWith: "!!".}=
  ## !! echo "hey!"
  ...
  ## >> echo "won't be uncommented"

```
