aplTeX is a minimal (~10 MiB) TeX distribution built on LuaTeX for
TeXnicians who needs a self-contained modern TeX setup.

Despite its name, it is not related with the A Programming Language in
any sense.

## Installation

The supported kernels are Linux and Darwin/XNU. Make sure you have
make, sed and curl installed, then use `build.sh` under the `scripts`
folder to build, and `clean.sh` to cleanup.

This will create the `texmf` folder which contains the built engine,
fonts and format. You can put it anywhere on your disk, but its name
should remain.

## Information

This project is licensed under the Clause-3 BSD License. Several files
in the source tree are provided as-is, subject to their respective
licenses.

The current version is 3.0.
