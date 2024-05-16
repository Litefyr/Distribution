import fs from "fs";
import settings from "./tailwind.litefyr.mjs";

const SOURCE = "./Packages/Carbon/Carbon.CodePen/Resources/Private/Build/buildTailwindConfig.mjs";
const TARGET = "./Packages/Litefyr/Litefyr.Integration/Resources/Public/Scripts/TailwindConfig.js";
const TAILWIND_FILE = "./Build/Litefyr.Tailwind/index.mjs";
fs.access(SOURCE, fs.F_OK, async (error) => {
    if (error) {
        console.warn("Carbon.CodePen is not installed");
        return;
    }
    const { buildTailwindConfig } = await import(SOURCE);
    buildTailwindConfig(TARGET, TAILWIND_FILE, settings);
});
