Makes résumés and CVs from the same LaTeX source file.

Use comments to tell the preprocessor what you want to show up in what contexts. Whenever you type `%CV`, the processor includes text on the left side as part of the resume and text on the right as part of the CV. For example:

```tex
This will show up in both the resume and the CV.
This will only show up in the resume. %CV
%CV This will only show up in the CV.
This will only show up in the resume. %CV This will only show up in the CV.
```

## Usage

Keep one tex source file called by default `resume.tex`. This can be changed; just edit the `F` variable in the makefile.

To build:

```sh
make all
# or
make resume
# or
make cv
```

To remove all LaTeX junk files:

    make sweep

To remove all generated files:

    make clean
