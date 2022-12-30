# dotfiles

## How I manage my dotfiles:

- Original files live in ~/dev/projects/dotfiles repo.

- On each machine, I create symlinks to home directory to source the required dotfiles.



## zsh plugins

- I use FZF as a file fuzzy finder. I usually use `**<tab>` or `<ctrl-T>` to search files in current directory (e.g. `vi **<tab>`).

- I use `zsh-z` to quickly navigate to frequently used directories (e.g. `z do`
  gets me to `~/dev/projects/dotfiles` from anywhere). Combined with the
  in-built fuzzy directory completion of zsh, and the fzt plugin, this makes
  navigation extremely quick.

## Useful tools

- I use [`bat`](https://github.com/sharkdp/bat) (an improved version of cat) to
  quickly view files.


## Next steps

- [ ] Use fzf for vim and tmux

- [ ] Consider using tmux instead of iterm2 tabs (see
  [this](https://thoughtbot.com/upcase/tmux) tutorial to get started)

- [ ] Check out other videos at [thoughtbot](https://thoughtbot.com/)

## Acknowledgements

- [engineeringfordatascience.com](https://engineeringfordatascience.com/) has a
  few amazing posts on mac setup for data science.

- [Ethan
  Rosenthal](https://www.ethanrosenthal.com/2022/02/01/everything-gets-a-package/)
  has a useful post on his workflow.


