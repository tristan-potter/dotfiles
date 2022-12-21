const themeName = 'base16-themer';

const render = (colors) => {
  activeColorset = 
  theme = `
  let g:colors_name = 'base16-themer'
  lua require('base16-colorscheme').setup({
    \ base00 = '${colors.dark.shade0}', -- shade0
    \ base01 = '${colors.dark.shade1}', -- shade1
    \ base02 = '${colors.dark.shade2}', -- shade2
    \ base03 = '${colors.dark.shade3}', -- shade3
    \ base04 = '${colors.dark.shade4}', -- shade4
    \ base05 = '${colors.dark.shade5}', -- shade5
    \ base06 = '${colors.dark.shade6}', -- shade6
    \ base07 = '${colors.dark.shade7}', -- shade7
    \ base08 = '${colors.dark.accent0}', -- accent0 / red
    \ base09 = '${colors.dark.accent1}', -- accent1 / orange
    \ base0A = '${colors.dark.accent2}', -- accent2 / yellow
    \ base0B = '${colors.dark.accent3}', -- accent3 / green
    \ base0C = '${colors.dark.accent4}', -- accent4 / cyan or teal
    \ base0D = '${colors.dark.accent5}', -- accent5 / blue
    \ base0E = '${colors.dark.accent6}', -- accent6 / purple, indigo, violet
    \ base0F = '${colors.dark.accent7}'  -- accent7 / violet, yellow, magenta
    \})
  `;
  return [
    Promise.resolve({
      name: `${themeName}.vim`,
      contents: Buffer.from(theme, 'utf8'),
    }),
  ];
};

const renderInstructions = (paths) => `
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

export default {
  render,
  renderInstructions,
};
