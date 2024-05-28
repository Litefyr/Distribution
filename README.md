# Litefyr Neos Base Distribution

## Installation

Create a project based on the [Litefyr] distribution

```bash
composer create-project litefyr/distribution custom-folder
```

Migrate database and add an admin user

```bash
ddev flow doctrine:migrate
ddev flow user:create --roles Administrator admin admin Admin User
```

alternativly, you can also use this repository as an template.

## CSS and JS files

Following files gets automatically included by [Litefyr.Presenation]:

| Filename     | Description                           | Imported by    |
| ------------ | ------------------------------------- | -------------- |
| `Backend.ts` | Gets included only in the backend     | [`Backend.ts`] |
| `Inline.ts`  | Gets inlined on every page            | [`Inline.ts`]  |
| `Main.ts`    | Gets included via `src` on every page | [`Main.ts`]    |
| `Main.pcss`  | Gets included into the Main CSS file  | [`Main.pcss`]  |

[litefyr]: https://litefyr.io
[litefyr.presenation]: http://github.com/Litefyr/Litefyr.Presentation
[`backend.ts`]: https://github.com/Litefyr/Litefyr.Presentation/blob/main/Resources/Private/Assets/Backend.ts
[`inline.ts`]: https://github.com/Litefyr/Litefyr.Presentation/blob/main/Resources/Private/Assets/Inline.ts
[`main.ts`]: https://github.com/Litefyr/Litefyr.Presentation/blob/main/Resources/Private/Assets/Main.ts
[`main.pcss`]: https://github.com/Litefyr/Litefyr.Presentation/blob/main/Resources/Private/Assets/Main.pcss
