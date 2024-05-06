import config from "./Packages/Blazing/Blazing.Theme/Resources/Private/Tailwind";
import content from "./Build/Carbon.Pipeline/content";
import settings from "./tailwind.blazing";

/** @type {import('tailwindcss').Config} */
export default {
    content,
    ...config(settings),
};
