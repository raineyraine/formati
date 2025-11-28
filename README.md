# formati
**formati** is a simple formatting library for creating valid Roblox [RichText Markup](https://create.roblox.com/docs/ui/rich-text) strings, getting rid of the need to memorize RichText tags.

## 📦 Installation
**formati** can be installed on [NPM](https://www.npmjs.com/package/@rbxts/formati) (for rbxts), or with [Wally]().

```bash
# w/ npm
$ npm install @rbxts/formati

# w/ yarn
$ yarn add @rbxts/formati

# w/ pnpm
$ pnpm add @rbxts/formati
```
```toml
# wally.toml
[dependencies]
formati = "_/formati@version"
```

Alternatively, a `rbxm` file is provided in the GitHub Releases menu.

## Documentation
This is primarily for Luau, as TypeScript documentation is provided in code comments.
### `string` formati.newline
The newline string used by the library.\
Defaults to `<br/>`

### `class` formati.Format
A formatter object. The `__tostring` metamethod is set, so it can be safely used in string interpolation without needing to call the `stringify()` method.

#### `constructor` new (raw: string)
Returns a new Format object

```luau
local formatter = Format.new("some text")

formatter:stringify() --> "some text"
tostring(formatter) --> "some text"
```
```typescript
const formatter = new Format("some text")
formatter.stringify() // -> "some text"
tostring(formatter) // -> "some text"
```

**TODO** add documentation for formatter methods

### `function` formati.f (raw: string)
A helper function that just creates a [`Format`](#class-formatiformat) object. The `raw` argument is passed to the [Format.new()](#constructor-new-raw-string) constructor.

> [!TIP]
> You should always use f() when formatting strings. It reduces the amount of typing needed in both TypeScript and Luau, while providing the exact same behavior.
>
> Declare `f` as a variable at the top of your script in Luau to further reduce typing.
> ```luau
> -- Luau
> local _formati = require(path.to.formati)
> local f = _formati.f
>
> print(`This is {f("formatted"):bold()} text!`)
> ```
> ```typescript
> // TypeScript
> import { f } from "@rbxts/formati"
> 
> print(`This is ${f("formatted").bold()} text!`)

## 📝 License
**formati** is provided under the MIT license. 