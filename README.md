# dotfiles

The files in this directory constantly evolve as I work towards improving my
workflow and fully automate the process to set up a develoment machine.


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

## tmux

### Workflow

- One client (i.e. use tmux in a single iTerm tab only), one session per
  project, as many windows as needed per session, as many tabs as needed per
  window, one vim instance per session (to avoid cross-editing files)


### Key bindings

- Custom configs in `.tmux.conf`

Panes 

- `<C-d>`: exit current pane
 `<prefix o>`: jump to other pane
- `<prefix z>`: toggle to zoom current pane into full-screen


Windows

- `<prefix ->`: split window vertically
- `<prefix \>`: split window horizontally
-
- `<prefix window-#>`: jump to window #
- `<prefix n>`: jump to next window
- `<prefix p>`: jump to previous window
- `<prefix l>`: jump to last window

Sessions

- `tat`: To open session, navigate to project directory and type `tat` (for tmux
  attach), which automatically creates a new session with the name of the
  project directory. The script lives in `~/bin`, and is from
  [here](https://github.com/thoughtbot/dotfiles/blob/main/bin/tat).

- `<C-j>`: open choose-tree to jump between sessions.
- `<prefix L>`: jump to last session

Scrollback

- Requires settings in .tmux.conf

- `<prefix [>`: enter copy-mode. From here can use vim-bindings to navigate long command output.


## Next steps

- [ ] Use tmux to manage multiple terminal sessions (work through
  [this](https://thoughtbot.com/upcase/tmux) tutorial to get started)

- [ ] Set up vim as Python IDE (following [this](https://www.youtube.com/watch?v=gfa2_6OeOkk) video)

- [ ] Complete additional thoughtbot tutorials and also look at destroy all [code](https://www.destroyallsoftware.com/screencasts)

- [ ] Adopt Chris Toomey dotfil [setup](https://github.com/christoomey/dotfiles)

- [ ] Read more engineeringfordatascience posts and integrate what is useful

- [ ] Nail Jupyter setup

- [ ] Look into Docker (useful
  [tutorial](https://www.youtube.com/playlist?list=PLy7NrYWoggjzfAHlUusx2wuDwfCrmJYcs) 

- [ ] Check out other videos at [thoughtbot](https://thoughtbot.com/)



## Acknowledgements

- [thoughtbot](https://thoughtbot.com/upcase) provides a series of useful
  courses on basic programming tools. Their
  [tmux](https://thoughtbot.com/upcase/tmux) course is phenomenal!

- [Chris Toomey](https://github.com/christoomey) produces many of the amazing thoughtbot videos and has inspired me to bring my dotfiles to the next level.

- [engineeringfordatascience.com](https://engineeringfordatascience.com/) has a
  few amazing posts on mac setup for data science.

- [Ethan
  Rosenthal](https://www.ethanrosenthal.com/2022/02/01/everything-gets-a-package/)
  has a useful post on his workflow.


