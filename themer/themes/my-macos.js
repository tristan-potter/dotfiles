module.exports.colors = {

  // A color set can have both light and dark variants, but is only required
  // to have one.
  dark: {

    // Colors can be defined in any valid CSS format.

    // accent0-7 should be the main accent colors of your theme. See the table
    // in the "Color mappings" section for how the colors will be used in your
    // new themes.
    accent0: '#ff6961',
    accent1: '#ffb340',
    accent2: '#ffd426',
    accent3: '#31de4b',
    accent4: '#70d7ff',
    accent5: '#409cff',
    accent6: '#da8fff',
    accent7: '#ff6482',

    // shade0-7 should be shades of the same hue, with shade0 being the
    // background and shade7 being the foreground. If you omit the
    // intermediate shades (1 through 6), they will be calculated automatically
    // for you.
    shade0: '#222222',
    shade1: '#2a2a2a',
    shade2: '#818181',
    shade3: '#818181',
    shade4: '#A29DA3',
    shade5: '#C1BCC2',
    shade6: '#E0DCE0',
    shade7: '#FFFCFF'
  },

  // Same as above, except that shade0 should be the lightest and shade7 should
  // be the darkest.
  light: {
    shade0: '#818181',
    shade7: '#000000',
    accent0: '#ff6961',
    accent1: '#ffb340',
    accent2: '#ffd426',
    accent3: '#31de4b',
    accent4: '#70d7ff',
    accent5: '#409cff',
    accent6: '#da8fff',
    accent7: '#ff6482',
  },
};
