export default function (ctx) {
    return {
        plugins: {
            "postcss-import": {
                resolve: ctx.resolve,
            },
            "tailwindcss/nesting": true,
            tailwindcss: ctx.tailwindcss,
            "postcss-assets": {
                cachebuster: false,
                basePath: `${ctx.basePath}/`,
                baseUrl: "/_Resources/Static/Packages",
                loadPaths: ["**/Resources/Public/**/*"],
            },
            "postcss-clip-path-polyfill": true,
            "postcss-sort-media-queries": true,
            "@thedutchcoder/postcss-rem-to-px": ctx.remToPx || false,
            autoprefixer: true,
            cssnano: ctx.minify
                ? {
                      preset: ["default", { discardComments: { removeAll: true }, svgo: false, calc: false }],
                  }
                : false,
            "postcss-reporter": {
                clearReportedMessages: true,
            },
        },
    };
}
