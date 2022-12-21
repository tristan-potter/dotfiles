# themer - theme installation instructions

## vim-lightline

Make sure that the `background` option is set in `.vimrc`.

Copy or symlink `vim-lightline/ThemerVimLightline.vim` to `~/.vim/autoload/lightline/colorscheme/`.

Then set the colorscheme in `.vimrc`:

    let g:lightline = { 'colorscheme': 'ThemerVimLightline' }

## vim

Copy or symlink `vim/ThemerVim.vim` to `~/.vim/colors/`.

Then set the colorscheme in `.vimrc`:

    " The background option must be set before running this command.
    colo ThemerVim

## vscode

Copy (or symlink) the generated package directory into the VS Code extensions directory:

    cp -R 'vscode/theme-themer-vscode' ~/.vscode/extensions/

Then reload or restart VS Code. The generated theme package should be in the list of installed extensions, and "Themer Dark" / "Themer Light" will be available in the list of themes.

## xcode

Copy (or symlink) the generated theme files to Xcode's themes directory:

    mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes
    cp 'xcode/Themer Dark.dvtcolortheme' ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
    cp 'xcode/Themer Light.dvtcolortheme' ~/Library/Developer/Xcode/UserData/FontAndColorThemes/

Then restart Xcode. The themes will be available in Preferences > Fonts and Colors.

## kitty

In the kitty configuration file (usually `~/.config/kitty/kitty.conf`), `include` the generated theme file:

    include kitty/themer-dark.conf
    include kitty/themer-light.conf

## wallpaper-block-wave

Files generated:

* `wallpaper-block-wave/themer-wallpaper-block-wave-dark-2880x1800.png`
* `wallpaper-block-wave/themer-wallpaper-block-wave-dark-750x1334.png`
* `wallpaper-block-wave/themer-wallpaper-block-wave-light-2880x1800.png`
* `wallpaper-block-wave/themer-wallpaper-block-wave-light-750x1334.png`

## chrome

1. Launch Chrome and go to `chrome://extensions`.
2. Check the "Developer mode" checkbox at the top.
3. Click the "Load unpacked extension..." button and choose the desired theme directory (`chrome/Themer Dark` or `chrome/Themer Light`).

(To reset or remove the theme, visit `chrome://settings` and click "Reset to Default" in the "Appearance" section.)

## slack

Copy the contents of `slack/themer-slack-dark.txt` or `slack/themer-slack-light.txt` and paste into the custom theme input in Slack's preferences.