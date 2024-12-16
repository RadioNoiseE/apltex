## Overview

aplTeX is a minimal TeX distribution built on LuaTeX and Web2C. It includes:

- **Engine**: Statically linked LuaTeX compiled with HarfBuzz and LuaJIT.
- **Fonts**: TFM and Type1 (Computer Modern, AMSFonts, Manual fonts).
- **Format**: Unicode aware plain-LuaTeX (original `plain.tex` modified for eTeX, pdfTeX and LuaTeX).

All packed into just 12.6MB.

Basically this is for TeXnicians who need a small, self-contained modern TeX setup. This has nothing to do with the A Programming Language.

## Installation

Tested on Darwin (Sequoia) and Linux (Gentoo), aplTeX has minimal dependencies:

- **Make**: Tested with GNU Make.
- **Clang**: Other C compilers require slight edits to [`comp.sh`](https://github.com/RadioNoiseE/apltex/blob/main/luatex/comp.sh).
- **Git**: Required to pull the LuaTeX source tree.

### Procedure

1. **Build**: Run `./make/build.sh` to create the `texmf` directory containing the engine, fonts, and dumped format.
2. **Install**: Use `./make/install.sh` to move `texmf` to `/usr/local/lib` and install the LuaTeX executable.
   - NB, you can actually put `texmf` anywhere on your disk, but its name should not be changed, and you are recommended to symlink the `texmf/web2c/luahbtex` executable to your `$PATH`.
3. **Clean (Optional)**: Run `./make/clean.sh` to remove the built `texmf` directory, locks for compile-time directories, and various logs.

Do not run the scripts as root as you will be prompted during installation to grant access when necessary.

## Post-Installation

Look in the [releases](https://github.com/RadioNoiseE/apltex/releases) page for some useful packaged and ready-to-use macros.

You can also manually add packages or formats. The directory structure looks like:

```
texmf
├── fonts               % place to drop font-related things
│   ├── map
│   ├── tfm
│   ├── ofm
│   ├── vf
│   ├── ovf
│   ├── type1
│   ├── truetype
│   └── opentype
├── generic             % TeX macros, Lua scripts, etc
├── metapost            % MetaPost macros, inputs, etc
└── web2c               % engine executables, TEXMF configuration, dumped formats
    ├── luajithbtex
    ├── luatex.fmt
    └── texmf.cnf
```

## Details

### Kpathsea Configuration

aplTeX uses a modified TeX and MetaFont directory tree structure, differing from the standard TDS slightly:

- **Compile-time**: `luatex/texmf.in`.
- **Run-time**: `web2c/texmf.cnf`.

Unlike typical TeX setups, aplTeX doesn't use `ls-R` databases due to its relatively small file count. This eliminates extra executables and simplifies updates.

### Format & Font Maps

aplTeX uses `luatex.map` for font mapping, which is more intuitive compared to the default `pdftex.map`. The dumped format includes a `\everyjob` hook to force this behavior.

## Misc

For questions or inquiries, feel free to open an issue or contact me via email.
