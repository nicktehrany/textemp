# textemp

I was tired of having to create new folder structure and latex files every time I had to create a new latex project
(which was quite often). Therefore I made a quick and simple command to set up the basic structure directory structure 
and initialize the .tex files with the most basic necessities.

## Setup

Open your .bashrc or .zshrc or other .*rc file you are using, and source the textemp script in there, like so:

```bash
source ~/PATH/TO/FOLDER/textemp
```

where ```/PATH/TO/FOLDER/ is the path to where the textemp script is saved.

## Execution

Execution is very simple. There is currently only 1 possible additional flag, besides providing the desired folder name.
The additonal flag is ```-c``` for Code Version, where the latex file will be initialized with basics for code listings
and style for such listings.
An execution would look as follows:

```bash
textemp Report -c
```

to create a folder called "Report" with the Code version template.
