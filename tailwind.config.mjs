import config from "./Build/Litefyr.Tailwind";
import content from "./Build/Carbon.Pipeline/content";
import settings from "./tailwind.litefyr";

/** @type {import('tailwindcss').Config} */
export default {
    content,
    ...config(settings),
};
