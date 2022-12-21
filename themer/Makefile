THEMER := npm run themer

# Themes
DEFAULT_THEME := @themerdev/colors-default
MACOS_THEME := macos-theme.js
SOLARIZED := @themerdev/colors-solarized
SOLARIZED_MACOS := macos-solarized.js
ATOM_ONE := @themerdev/colors-one
ATOM_ONE_MACOS := macos-atom-one.js

# Templates
VIM_LIGHTLINE_TEMPLATE := @themerdev/vim-lightline
VIM_TEMPLATE := @themerdev/vim
VSCODE_TEMPLATE := @themerdev/vscode
XCODE_TEMPLATE := @themerdev/xcode
KITTY_TEMPLATE := @themerdev/kitty
WALLPAPER_TEMPLATE := @themerdev/wallpaper-block-wave
CHROME_TEMPLATE := @themerdev/chrome
SLACK_TEMPLATE := @themerdev/slack
TMUX_TEMPLATE := themer-tmux

TEMPLATE_CONFIG := -t ${VIM_LIGHTLINE_TEMPLATE} -t ${VIM_TEMPLATE} -t ${VSCODE_TEMPLATE} -t ${XCODE_TEMPLATE} -t ${KITTY_TEMPLATE} -t ${WALLPAPER_TEMPLATE} -t ${CHROME_TEMPLATE} -t ${SLACK_TEMPLATE} -t ${TMUX_TEMPLATE}

OUT := out

all:

macos_base: macos-theme.js
	${THEMER} -c ${MACOS_THEME} ${TEMPLATE_CONFIG} -o out/default

# Need to copy all the colours and template files locally. Then 

default_theme:

macos_theme:
solarized_theme:
atom_one_theme:
custom_solarized_theme:
custom_atom_one_theme:

\\

active:

clean:
	rm -rf ./active/**
