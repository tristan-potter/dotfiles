const themeName = 'base16-themer';

const render = (colors, args) => {
  console.log('rendering neovim', args);
  const theme = (activeColorset) => {
    return `
      let g:colors_name = 'base16-themer'
      lua require('base16-colorscheme').setup({
        \ base00 = '${activeColorset.shade0}', -- shade0
        \ base01 = '${activeColorset.shade1}', -- shade1
        \ base02 = '${activeColorset.shade2}', -- shade2
        \ base03 = '${activeColorset.shade3}', -- shade3
        \ base04 = '${activeColorset.shade4}', -- shade4
        \ base05 = '${activeColorset.shade5}', -- shade5
        \ base06 = '${activeColorset.shade6}', -- shade6
        \ base07 = '${activeColorset.shade7}', -- shade7
        \ base08 = '${activeColorset.accent0}', -- accent0 / red
        \ base09 = '${activeColorset.accent1}', -- accent1 / orange
        \ base0A = '${activeColorset.accent2}', -- accent2 / yellow
        \ base0B = '${activeColorset.accent3}', -- accent3 / green
        \ base0C = '${activeColorset.accent4}', -- accent4 / cyan or teal
        \ base0D = '${activeColorset.accent5}', -- accent5 / blue
        \ base0E = '${activeColorset.accent6}', -- accent6 / purple, indigo, violet
        \ base0F = '${activeColorset.accent7}'  -- accent7 / violet, yellow, magenta
      \})
    `;
  };

  return Object.entries(colors).map(async ([name, activeColorset]) => ({
    name: `${themeName}-${name}.vim`,
    contents: Buffer.from(theme(activeColorset), 'utf8'),
  }));
};

const renderInstructions = (paths) => {
  return `
    This theme requires neovim to be installed and setup with [nvim-base16
    plugin](https://github.com/RRethy/nvim-base16).

    Make sure that the \`background\` option is set in \`.vimrc\`.

    Copy or symlink \`${paths[0]}\` to \`config/nvim/colors/\`. NeoVim obeys
    \`XDG_CONFIG_HOME\`.

    \`\`\`bash
      cp ${paths[0]} \${XDG_CONFIG_HOME:-$HOME/.config}/nvim/colors/
      ln -s ${paths[0]} \${XDG_CONFIG_HOME:-$HOME/.config}/nvim/colors/
    \`\`\`

    Then set the colorscheme:

    \`init.vim\`:
    \`\`\`vim
      colorscheme ${themeName}
    \`\`\`

    \`init.lua\`:
    \`\`\`lua
      vim.cmd(\'colorscheme ${themeName}\')
    \`\`\`
  `;
};

export default {
  name: 'neovim-template',
  render: () => render(),
  renderInstructions,
};
