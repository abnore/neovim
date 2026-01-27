# Tmux Cheatsheet

## Key Commands

Start a new session

```shell
tmux new -s NewSession
```

Exit session

```shell
tmux detach
```

List sessions

```shell
tmux ls
```

Go back into session

```shell
tmux attach -t NewSession
```

Show all available options

```shell
tmux show-options -g
```

Show all available shortcuts

```shell
tmux list-keys
```

Show all available commands

```shell
tmux list-commands
```

Start fresh

```shell
tmux kill-server && rm -rf /tmp/tmux-*
```

Enable plugins

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Essential Shortcuts

- Prefix: `C - <Space>`
- Command mode: `Prefix - :`
- Cycles pane layouts: `Prefix - <Space>` (C-space-space)
- Create new tmux window: `Prefix - c`
- Rename window: `Prefix - ,`
- Rename session: `Prefix - $`
- Navigate to window: `Prefix - number`
- Cycle through window: `Prefix - n/p`
- See all windows: `Prefix - w`
- Explore sessions: `Prefix - s`
- Save sessions: `Prefix - CTRL - s`
- Detach: `Prefix - d`
- Restore session: `Prefix - CTRL - r`
- Install plugins: `Prefix - I`

## Useful Snippets

Add this to you `.zshrc` or `.zprofile` to always work in a Tmux session:

```shell
# Always work inside a tmux session in zsh
if [[ -z $TMUX ]]; then
    tmux has-session > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        exec tmux new -s default
    else
        exec tmux attach
    fi
fi
```
