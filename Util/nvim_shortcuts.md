
LEADER = SPACE


### Basic insert commands

| Command | Action                                                   |
| ------- | -------------------------------------------------------- |
| `i`     | Insert **before** the cursor.                            |
| `I`     | Insert at the **first non-blank** character of the line. |
| `a`     | Append (insert **after** the cursor).                    |
| `A`     | Append at the **end** of the line.                       |
| `o`     | Open a **new line below** and start insert mode.         |
| `O`     | Open a **new line above** and start insert mode.         |

---

### Insert on specific characters / text objects

| Command   | Action                                                                              |
| --------- | ----------------------------------------------------------------------------------- |
| `ciw`     | Change inside word (delete the current word and start insert mode).                 |
| `cw`      | Change to the end of the current word (delete and insert).                          |
| `cc`      | Change the whole line (like `S`).                                                   |
| `C`       | Change from cursor to end of line (delete rest of line and insert).                 |
| `s`       | Substitute (delete one character and insert).                                       |
| `S`       | Substitute whole line (delete and insert; same as `cc`).                            |
| `r{char}` | Replace the character under the cursor with `{char}` (no insert mode, single char). |
| `R`       | Enter **replace mode** — type over existing text until `<Esc>`.                     |

---

### Special “insert mode” quirks and combos

| Key                 | Meaning                                                                        |
| ------------------- | ------------------------------------------------------------------------------ |
| `<C-h>`             | Backspace (delete before cursor).                                              |
| `<C-w>`             | Delete **previous word**.                                                      |
| `<C-u>`             | Delete to **start of line**.                                                   |
| `<C-o>`             | Execute **one normal mode command**, then return to insert mode. (Very handy!) |
| `<C-r>{register}`   | Insert the contents of a **register** (like clipboard) at cursor.              |
| `<C-t>` / `<C-d>`   | **Increase / decrease indent** in insert mode.                                 |
| `<C-n>` / `<C-p>`   | Trigger insert-mode **completion** (next/previous match).                      |
| `<C-x>` subcommands | Various insert completions (e.g. `<C-x><C-f>` = filename completion).          |

---

### Other interesting “insert-ish” normal mode tricks

| Command        | Action                                                              |
| -------------- | ------------------------------------------------------------------- |
| `gi`           | Re-enter insert mode at the **last insert position**.               |
| `gI`           | Insert at **column 1** (absolute beginning of line).                |
| `.`            | Repeat the **last change**, including insert text.                  |
| `:startinsert` | Enter insert mode from command line (useful in macros or mappings). |

---

### Example combos

* `A<C-o>dd` → Append to end of line, delete the next line, stay in insert mode.
* `I--<Esc>` → Insert `--` at start of line, back to normal mode.
* `cwfoo<Esc>` → Replace current word with “foo”.
* `gi` → Jump back into the exact spot you were typing before leaving insert mode.

---
