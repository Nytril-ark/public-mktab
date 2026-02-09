```bash
grep "word" *
```
Searches for `word` in all files in the current directory (not subdirectories).


#### Case-insensitive search

```bash
grep -ri "word" /path/to/directory
```

#### Show line numbers

```bash
grep -rn "word" /path/to/directory
```

#### Show only filenames that contain the word

```bash
grep -rl "word" /path/to/directory
```

#### Match whole words only

```bash
grep -rw "word" /path/to/directory
```

---

### Ignore binary files

```bash
grep -rI "word" /path/to/directory
```
