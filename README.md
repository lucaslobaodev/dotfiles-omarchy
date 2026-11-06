# dotfiles (Omarchy)

- `bin/dotfiles save` — copia as configs para `home/`, commita e dá push
- `bin/dotfiles restore` — devolve as configs (guarda o estado atual em `~/.local/state/dotfiles-backup/`)
- `bin/dotfiles diff` — mostra o que mudou

Um hook `post-update` do Omarchy roda `restore` sozinho depois de cada `omarchy update`.
