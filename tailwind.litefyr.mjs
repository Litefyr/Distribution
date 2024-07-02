// In this file you can override the settings from Litefyr.Tailwind/index.mjs

export default {
    pluginSettings: {
        contentDimensions: {},
        oklch: {},
    },
    theme: {
        extend: {
            // https://utopia.fyi/type/calculator/
            // https://utopia.fyi/space/calculator/
            utopia: {
                //  the screen size the scale starts at in px (unitless integer)
                minWidth: 320,
                // the base font size at the minScreen size (unitless integer)
                minSize: 21,
                // the modular scale to use for type sizes at minScreen size (decimal)
                minScale: 1.2,
                // the screen size at which the scale stops increasing in px (unitless integer)
                maxWidth: 1140,
                //  the base font size a the maxScreen size (unitless integer)
                maxSize: 24,
                // the modular scale to use at the maxScreen size (decimal)
                maxScale: 1.25,
            },
        },
    },
};
