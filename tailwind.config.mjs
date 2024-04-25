import config from "./Packages/Litespeed/Litespeed.Theme/Resources/Private/Tailwind";
import content from "./Build/Carbon.Pipeline/content";
import settings from "./tailwind.litespeed";

/** @type {import('tailwindcss').Config} */
export default {
    content,
    ...config(settings),
};
