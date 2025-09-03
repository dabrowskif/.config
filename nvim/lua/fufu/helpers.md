# Replace a buffer
1. delete all lines with todo
:g/todo/d

2. delete all lines without todo
:g!/todo/d

3. run macro for given pattern 
:g/pattern/normal @q

4. delete all lines with console.log (using normal mode dd)
:g/console\.log/normal dd

5. replace all empty lines with ---
:g/^$/s//---/

6. prefix all lines with //
:g/^/normal I// 

7. add semicolons to end of every line
:g/^/normal A; 


---
# Quickfix list
1. Open
:copen - open


# Locations
:argdo → all files in :args list
:bufdo → all open buffers
:windo → all open windows
:tabdo → all tabs
:cfdo → all files in the quickfix list


# Quickfix list actions

1. find occurences and save to QF
:vimgrep /foo/ **/*.ts

2. replace all foo with bars in all qf files
:cfdo %s/foo/bar/g | update


# Sample workflow:
find all occurences & replace

```vim
:cexpr system('git grep -n "^\s*SOME_PATTERN\s*="')
```
```vim
:copen
```

```vim
:cdo s/^\(\s*SOME_PATTERN\s*=\s*\)"\zs[^"]*\ze"/NEW_CODE/
```
Or to replace entire line:
```vim
:cdo s/^\s*SOME_PATTERN\s*=.*/  SOMETHING = "your_new_url"/
```

```vim
:cfdo update
```
