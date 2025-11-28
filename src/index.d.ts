export = formati;
export as namespace formati;

/**
 * A simple Luau and rbxts library for formatting Roblox RichText
 */
declare namespace formati {
	/**
	 * The newline string used by the library.
	 * Defaults to `<br/>`
	 */
	const newline: "<br/>";

	/**
	 * Describes how the `<font>` tag will be applied.
	 * @see {@link https://create.roblox.com/docs/ui/rich-text#font-color} See the Roblox font tag documentation
	 */
	interface FontProps {
		color?: string | Color3;
		size?: number;
		face?: string;
		family?: string;
		weight?: string | number;
		transparency?: number;
	}

	/**
	 * Describes how the `<stroke>` tag will be applied.
	 * @see {@link https://create.roblox.com/docs/ui/rich-text#stroke} See the Roblox stroke tag documentation
	 */
	interface StrokeProps {
		color?: string | Color3;
		thickness?: number;
		transparency?: number;
		joins?: "round" | "bevel" | "miter";
		sizing?: "fixed" | "scaled";
	}

	/**
	 * Describes how the `<mark>` tag will be applied.
	 * @see {@link https://create.roblox.com/docs/ui/rich-text#mark} See the Roblox mark tag documentation
	 */
	interface MarkProps {
		color?: string | Color3;
		transparency?: number;
	}

	interface Format<T> {
		autoEscape: boolean;

		stringify(): string;

		escape(): this;
		font(props?: FontProps): this;
		stroke(props?: StrokeProps): this;
		bold(): this;
		italic(): this;
		underline(): this;
		strike(): this;
		smallcaps(): this;
		upper(): this;
		linebreak(count?: number): this;
		mark(props?: MarkProps): this;
		comment(): this;
	}

	/**
	 * A formatter object. The `__tostring` metamethod is set, so it can be safely used in
	 * string interpolation without needing to call the `stringify()` method.
	 *
	 * ```typescript
	 * const formatter = new Format("some text")
	 * formatter.stringify() // -> "some text"
	 * tostring(formatter) // -> "some text"
	 * `${formatter}` // -> "some text"
	 * ```
	 */
	class Format<T> implements Format<T> {
		constructor(raw: T);
	}

	/**
	 * A helper function that just creates a [`Format`](#class-formatiformat) object.
	 * The `raw` argument is passed to the [Format.new()](#constructor-new-raw-string) constructor.
	 *
	 * You should always use f() when formatting strings. It reduces the amount of typing needed, while
	 * providing the exact same behavior as `new Format(raw)`.
	 *
	 * ```typescript
	 * `${new Format("raw")}` // -> "raw"
	 * `${f("raw")}` // -> "raw"
	 *
	 * // Both are the same!
	 */
	const f: <T>(raw: T) => Format<T>;
}
