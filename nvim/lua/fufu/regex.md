## 1. Literal Characters
The simplest regex - just match exact text:

```regex
hello
```
Matches: "hello" anywhere in text

```regex
EPG_URL
```
Matches: "EPG_URL" anywhere in text

## 2. Special Characters (Metacharacters)
These have special meaning: `. ^ $ * + ? { } [ ] \ | ( )`

### The Dot (.) - Matches ANY single character
```regex
h.llo
```
Matches: "hello", "hallo", "h3llo", "h@llo"

### Anchors - Position matters
```regex
^hello
```
Matches: "hello" **only at start of line**

```regex
hello$
```
Matches: "hello" **only at end of line**

```regex
^hello$
```
Matches: **entire line** must be exactly "hello"

## 3. Character Classes [ ]
Match ONE character from a set:

```regex
[abc]
```
Matches: "a" OR "b" OR "c"

```regex
[a-z]
```
Matches: any lowercase letter

```regex
[A-Z]
```
Matches: any uppercase letter

```regex
[0-9]
```
Matches: any digit

```regex
[a-zA-Z0-9]
```
Matches: any letter or digit

## 4. Predefined Character Classes
Shortcuts for common patterns:

```regex
\d
```
Same as `[0-9]` - any digit

```regex
\w
```
Same as `[a-zA-Z0-9_]` - word characters

```regex
\s
```
Matches whitespace (space, tab, newline)

**Uppercase versions are OPPOSITE:**
```regex
\D
```
NOT a digit

```regex
\W
```
NOT a word character

```regex
\S
```
NOT whitespace

## 5. Quantifiers - How many times?

```regex
a*
```
"a" **zero or more times** - matches "", "a", "aa", "aaa"...

```regex
a+
```
"a" **one or more times** - matches "a", "aa", "aaa"... (NOT "")

```regex
a?
```
"a" **zero or one time** - matches "" or "a"

```regex
a{3}
```
"a" **exactly 3 times** - matches "aaa"

```regex
a{2,5}
```
"a" **2 to 5 times** - matches "aa", "aaa", "aaaa", "aaaaa"

## 6. Practice with Your EPG_URL Example

Let's break down your pattern: `^\s*EPG_URL\s*=`

```regex
^
```
Start of line

```regex
\s*
```
Zero or more whitespace characters (spaces, tabs)

```regex
EPG_URL
```
Literal text "EPG_URL"

```regex
\s*
```
Zero or more whitespace again

```regex
=
```
Literal equals sign

**Put together:** Line starts with optional spaces, then "EPG_URL", then optional spaces, then "="

## 7. Grouping with ( )
Parentheses group things together:

```regex
(abc)+
```
Matches: "abc", "abcabc", "abcabcabc"...

```regex
(hello|world)
```
Matches: "hello" OR "world"

## 8. Advanced: \zs and \ze (Vim-specific)
These set match boundaries:

```regex
prefix\zsimportant\zesufix
```
- Matches the whole thing: "prefiximportantsufix"
- But only **replaces** "important"
- Keeps "prefix" and "sufix" unchanged
