# textemp

I was tired of having to create new folder structure and latex files every time I had to create a new latex project
(which was quite often). Therefore I made a quick and simple command to set up the basic directory structure
and initialize the .tex files with the most basic necessities.

## Setup

Source the textemp script in your .bashrc, .zshrc or other .*rc file you are using, like so:

```bash
source ~/PATH/TO/FOLDER/textemp/textemp
```

where /PATH/TO/FOLDER/ is the path to where the textemp repository is saved. (Note the repository folder is called textemp,
as well as the script)

## Execution

Execution is very simple. There is currently only 1 possible additional flag, besides providing the desired folder name.
The additional flag is ```-c``` for Code Version, where the latex file will be initialized with basics for code listings
and style for such listings.
The command would look as follows:

```bash
textemp Report -c
```

to create a folder called "Report" with the Code version template.
