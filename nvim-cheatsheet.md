# Neovim Cheatsheet — vkumbhar94/nvimdots

Leader key: `<Space>`. Press `<C-p>` any time to search all bindings live —
this sheet is a backup, not a replacement for that.

---

## Week 1 — Movement

| Key | Action |
|---|---|
| `f{char}` / `t{char}` | jump to / before next `{char}` on line |
| `;` / `,` | repeat last f/t forward / backward |
| `{` / `}` | previous / next paragraph |
| `%` | jump to matching bracket (vim-matchup extends to if/end etc.) |
| `H` / `M` / `L` | top / middle / bottom of screen |
| `<C-d>` / `<C-u>` | half page down / up |
| `zz` | center cursor line on screen |
| `<C-o>` / `<C-i>` | back / forward in jump history |
| `<leader>c` | hop to any character (hop.nvim) |
| `<leader>w` | hop to word |
| `<leader>j` | hop to line |

---

## Week 2 — Operators + Text Objects

Grammar: `{operator}{text object}` → `d`/`c`/`y`/`v` × `iw`/`aw`/`i(`/`a{`/`i"`/`it`/`ip`

| Key | Action |
|---|---|
| `ci(` | change inside parens (cursor anywhere inside) |
| `daf` / `vif` | delete function outer / select function inner (treesitter) |
| `dac` / `vic` | delete class outer / select class inner (treesitter) |
| `dih` | delete git hunk |
| `][` / `]m` | jump to next function/class end / start |
| `[[` / `[m` | jump to previous function/class start |
| `;` | repeat last `[[`/`]]`-style jump |
| `.` | repeat last change |

---

## Week 3 — Project Navigation

| Key | Action |
|---|---|
| `<leader>ff` | find files (frecency-ranked) |
| `<leader>fp` | live grep project (supports inline rg flags, e.g. `foo -t py`) |
| `<leader>fr` | resume last search |
| `<C-n>` | toggle file tree |
| `<leader>nf` | reveal current file in tree |
| `<A-i>` / `<A-o>` | next / previous buffer |
| `<A-1>`…`<A-9>` | jump to buffer by number |
| `<A-q>` | close buffer |
| `<C-h/j/k/l>` | focus window (left/down/up/right) |
| `<A-h/j/k/l>` | resize window |
| `tn` / `tj` / `tk` | new tab / prev tab / next tab |

---

## Week 4 — LSP & Completion

| Key | Action |
|---|---|
| `gd` | peek definition (inline) |
| `gD` | go to definition |
| `gh` | finder (references + definitions) |
| `gm` | show implementations |
| `gr` | rename |
| `gR` | rename across project |
| `ga` | code action |
| `K` | hover docs |
| `gs` | signature help |
| `g[` / `g]` | previous / next diagnostic |
| `gt` | all diagnostics (Trouble) |
| `go` / `gto` | symbol outline (Telescope) |
| `gci` / `gco` | incoming / outgoing calls |
| `<leader>lh` | toggle inlay hints |
| `<leader>lv` | toggle virtual lines (diagnostics) |
| `<A-S-f>` | format buffer |
| `<A-f>` | toggle format-on-save |
| **Completion (blink.cmp)** | |
| `<C-n>` / `<C-p>` | next / previous completion item |
| `<Tab>` | next item / jump snippet placeholder |
| `<CR>` | accept completion |
| `<C-f>` / `<C-d>` | scroll docs popup down / up |
| `<C-w>` | cancel completion |

---

## Week 5 — Git, Refactor, Terminal, Debug

| Key | Action |
|---|---|
| `]g` / `[g` | next / previous git hunk |
| `<leader>gp` | preview hunk |
| `<leader>gs` | stage hunk |
| `<leader>gr` | reset hunk |
| `<leader>gb` | blame line |
| `<leader>gg` | open lazygit |
| `<leader>gd` | diffview |
| `<leader>Sp` | search & replace word under cursor, project-wide (grug-far) |
| `<leader>Sf` | search & replace, current file only |
| `gea` | align block on delimiter (mini.align) |
| `<C-\>` | horizontal terminal |
| `<A-d>` | floating terminal |
| `<Esc><Esc>` | exit terminal insert mode |
| `<F8>` | toggle breakpoint |
| `<F6>` | run / continue (DAP) |
| `<F11>` | step over |
| `<F9>` | step into |
| `<leader>dC` | close debug UI |

---

## Sessions (auto-session / persisted.nvim)

| Key | Action |
|---|---|
| `<leader>ss` | save session (auto-named by cwd + branch) |
| `<leader>sl` | load session for current cwd + branch |
| `<leader>sd` | delete current session |
| `<leader>sn` | save session with a custom name (if configured) |
| `<leader>sf` | find/browse all sessions (Telescope) |
| `<leader>fd` | open "dossier" collection (Sessions, Projects, Zoxide) |

---

## Telescope Extensions

| Extension | Access | What it does |
|---|---|---|
| frecency | `<leader>ff` | file picker ranked by frequency + recency |
| live_grep_args | `<leader>fp` | grep with inline rg flags |
| zoxide | `<leader>fd` | jump to directory by frecency |
| projects | `<leader>fd` | switch between recent project roots |
| persisted / session-lens | `<leader>fd` / `<leader>sf` | browse sessions |
| undo | `:Telescope undo` | visual undo-tree browser |
| notify | `<C-p>` → search notify | history of past notifications |
| advanced_git_search | `<leader>fd` or `<leader>g*` | search commits/diffs/file history |
| fzf-native | always on | faster fuzzy sorting for all pickers |

---

## Vanilla Vim — Macros

| Key | Action |
|---|---|
| `qa` ... `q` | record macro into register `a` |
| `@a` | play macro `a` once |
| `@@` | replay last-played macro |
| `5@a` | play macro `a` 5 times |
| `100@a` | play macro `a` up to 100 times (stops early on error) |
| `:normal @a` (on visual selection) | run macro on every selected line |
| `"ap` | paste register `a` as literal text (to edit a macro) |
| `"ayy` | yank a line back into register `a` (to save an edited macro) |

**Workflow:** `qa` → edit one line → `j` → `q` → `39@a` to repeat across the rest.

---

## Vanilla Vim — Marks

| Key | Action |
|---|---|
| `ma` | set mark `a` at cursor (a–z = local to buffer) |
| `` `a `` | jump to exact position of mark `a` |
| `'a` | jump to start of line of mark `a` |
| `mA` | set global mark `A` (A–Z = works across files) |
| `` `A `` | jump to global mark `A` from any file |
| `` `` `` | jump to position before last jump (toggle) |
| `` `. `` | jump to location of last edit |
| `` `^ `` | jump to location where insert mode was last exited |
| `` `[ `` / `` `] `` | start / end of last changed or yanked text |
| `` `[v`] `` | reselect last changed/yanked text |
| `:marks` | list all active marks |
| `:delmarks a` | delete mark `a` |
| `:delmarks!` | clear all lowercase marks in buffer |

---

## Practice Habits

- Do real work in nvim from day one — expect ~2 weeks of feeling slower.
- Keep a friction log: one line per annoyance, look it up daily via `<C-p>` or `:h`.
- No mouse for two weeks.
- Learn one new key at a time and deliberately overuse it.
- `:Tutor dots` — walkthrough specific to this config.
- `:checkhealth`, `:Lazy` (`<leader>ph`), `:LspInfo` (`<leader>li`) for diagnosing issues.
