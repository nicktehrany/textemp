<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" />
</a>

# textemp

I was tired of having to create new folder structure and latex files every time I had to create a new latex project
(which was quite often). Therefore I made a quick and simple command to set up the basic directory structure
and initialize the .tex files with the most basic necessities.

## Setup

Copy the `textemp` file to your `bin` directory (or source it in your `.bashrc` or `.zshrc`) and export the location of
this directory.

```bash
git clone https://github.com/nicktehrany/textemp

# copy the binary to your bin dir
cp textemp/textemp ~/bin/

# Export the location (change to dir where you have it!)
[ -d $HOME/dotfiles/bin/textemp ] && export TEXTEMP="$HOME/dotfiles/bin/textemp"
```

If in doubt, have a look at my [.zshrc](https://github.com/nicktehrany/dotfiles/blob/master/zsh/.zshrc), which is contained
within my [dotfiles](https://github.com/nicktehrany/dotfiles) repository.

## Execution

Execution is very simple. Templates will initialize the folder with basic latex files and a full Makefile for the project.
There are currently only 5 templates available; article template, article template with code listing style, exercise
report (handy for multiple exercises in an assignments), exercise report with code listing style, and the IEEE trans template.
The command would look as follows:

```bash
textemp [FOLDER] -[FLAG]
```

with possible flags:

```bash
a # Article template
ac # Article with Code template
e # Exercise report template
ec # Exercise report with Code template
IEEE # For IEEE trans template
pres # LaTeX beamer presentation template
```

A possible execution would look as follows,

```bash
textemp Report -ac
```

to create a folder called "Report" with the Article Code version template.
