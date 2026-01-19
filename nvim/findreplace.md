# Neovim: Search & Replace with Ripgrep + Quickfix

## Basic Flow

### 1. Search (populate quickfix)
```vim
:grep "search_pattern"
```

For literal strings (no regex):
```vim
:grep -F "exact string"
```

### 2. Review matches
```vim
:copen
```

### 3. Replace in all files
```vim
:cfdo %s/old_text/new_text/ge | update
```

## Command Breakdown

| Command | Description |
|---------|-------------|
| `:grep` | Uses ripgrep (respects .gitignore) |
| `:copen` | Open quickfix window |
| `:cclose` | Close quickfix window |
| `:cfdo` | Execute command for each file in quickfix |
| `%s/old/new/ge` | Substitute all in file (suppress errors) |
| `update` | Save only if modified |

## Common Options

| Flag | Purpose |
|------|---------|
| `-F` | Fixed string (literal, no regex) |
| `-i` | Case insensitive |
| `-w` | Match whole words only |

## Examples

### Simple text replacement
```vim
:grep "oldName" | cfdo %s/oldName/newName/ge | update
```

### With confirmation (interactive)
```vim
:grep "pattern" | cfdo %s/old/new/gce | update
```

### Case-insensitive search
```vim
:grep -i "TODO" | copen
```

### Whole word only
```vim
:grep -w "test" | cfdo %s/\<test\>/spec/ge | update
```

## Tips

- Ripgrep already respects `.gitignore` by default
- Use `:copen` to verify matches before replacing
- Use `c` flag for confirmation: `/gce` instead of `/ge`
- Navigate quickfix: `:cnext`, `:cprev`, `:cfirst`, `:clast`
