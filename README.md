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


## Next steps

- [ ] Set up vim as Python IDE (following [this](https://www.youtube.com/watch?v=gfa1_6OeOkk) video)

- [ ] Have a basic data science workflow setup (explore in Jupyter, write code in terminal vim in tmux)
      
    - [x] Use tmux to manage multiple terminal sessions - work through [this](https://thoughtbot.com/upcase/tmux) tutorial to get started. A truly awesome series of videos!

    - [x] Install useful vim plugins from [this](https://www.youtube.com/watch?v=gfa2_6OeOkk) video

    - Look into autocomplete, isort, [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) from above video

    - [ ] Improve fugivite workflow (check thoughtbox tutorials)

    - [ ] 

- [ ] Complete additional thoughtbot tutorials and also look at destroy all [code](https://www.destroyallsoftware.com/screencasts)

- [ ] Adopt Chris Toomey dotfil [setup](https://github.com/christoomey/dotfiles) (i.e. separate file for logical chunks like for each plugin (with all settings and mappings) and one main file that pulls all these files in.)

- [ ] Read more engineeringfordatascience posts and integrate what is useful

- [ ] Nail Jupyter setup

- [ ] Look into Docker (useful
  [tutorial](https://www.youtube.com/playlist?list=PLy7NrYWoggjzfAHlUusx2wuDwfCrmJYcs) 

- [ ] Check out other videos at [thoughtbot](https://thoughtbot.com/)


## Ongoing pain-points

- Blog posts with best practices and dotfiles in separate directories means I have to switch back and forth between them often, as I use them quite often together.


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


## Completed work

