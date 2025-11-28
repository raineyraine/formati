export = formati;
export as namespace formati;

/**
 * A simple Luau and rbxts library for formatting Roblox RichText
 */
declare namespace formati {
	/**
	 * The newline string used by the `linebreak()` function.
	 *
	 * @default "<br/>"
	 */
	export let newline: string;

	/**
	 * Describes how the `<font>` tag will be applied.
	 * @see {@link https://create.roblox.com/docs/ui/rich-text#font-color} See the Roblox font tag documentation
	 */
	export interface FontProps {
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
	export interface StrokeProps {
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
	export interface MarkProps {
		color?: string | Color3;
		transparency?: number;
	}

	interface Format<T> {
		/**
		 * Whether to automatically escape RichText [special characters](https://create.roblox.com/docs/ui/rich-text#escape-forms) when
		 * {@link stringify|`stringify`} is called
		 * @default true
		 */
		autoEscape: boolean;

		/**
		 * Stringifies the Format object. If {@link autoEscape|`autoEscape`} is true, then RichText [special characters](https://create.roblox.com/docs/ui/rich-text#escape-forms)
		 * are escaped automatically.
		 *
		 * Formatting is done in the following order:
		 * * character escapes
		 * * all other formatting, done in the order they're described in the [RichText documentation](https://create.roblox.com/docs/ui/rich-text)
		 * * {@link linebreak|`linebreak`}
		 * * {@link comment|`comment`}
		 */
		stringify(): string;

		/**
		 * Escape RichText [special characters](https://create.roblox.com/docs/ui/rich-text#escape-forms). Sets {@link autoEscape|`autoEscape`}
		 * to false.
		 */
		escape(): this;

		/**
		 * Apply the <font> tag with the given attributes
		 *
		 * @param props - The font attributes to apply
		 */
		font(props?: FontProps): this;

		/**
		 * Apply the <stroke> tag with the given attributes
		 *
		 * @param props - The stroke attributes to apply
		 */
		stroke(props?: StrokeProps): this;

		/**
		 * Apply the <b> tag
		 */
		bold(): this;
		/**
		 * Apply the <i> tag
		 */
		italic(): this;
		/**
		 * Apply the <u> tag
		 */
		underline(): this;
		/**
		 * Apply the <s> tag
		 */
		strike(): this;
		/**
		 * Apply the <sc> tag
		 */
		smallcaps(): this;
		/**
		 * Apply the <sc> tag
		 */
		upper(): this;

		/**
		 * Apply the <br/> tag (or the {@link newline|`newline`} property) for the specified `count`
		 *
		 * @param count - The number of linebreaks to apply
		 */
		linebreak(count?: number): this;

		/**
		 * Apply the <mark> tag with the given attributes
		 *
		 * @param props - The mark attributes to apply
		 */
		mark(props?: MarkProps): this;

		/**
		 * Apply the <!-- --> tag, preventing the richtext from being rendered
		 */
		comment(): this;
	}

	/**
	 * A formatter object. The `__tostring` metamethod is set, so it can be safely used in
	 * string interpolation without needing to call the {@link stringify|`stringify()`} method.
	 *
	 * @example
	 * ```typescript
	 * const formatter = new Format("some text")
	 * formatter.stringify() // -> "some text"
	 * tostring(formatter) // -> "some text"
	 * `${formatter}` // -> "some text"
	 * ```
	 */
	export class Format<T> implements Format<T> {
		constructor(raw: T);
	}

	/**
	 * A helper function that just creates a [`Format`](#class-formatiformat) object.
	 * The `raw` argument is passed to the [Format.new()](#constructor-new-raw-string) constructor.
	 *
	 * You should always use f() when formatting strings. It reduces the amount of typing needed, while
	 * providing the exact same behavior as `new Format(raw)`.
	 *
	 * @example
	 * ```typescript
	 * `${new Format("raw")}` // -> "raw"
	 * `${f("raw")}` // -> "raw"
	 *
	 * // Both are the same!
	 */
	export const f: <T>(raw: T) => Format<T>;
}
