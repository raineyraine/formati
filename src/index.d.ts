export = formati;
export as namespace formati;

declare namespace formati {
	const newline: "<br/>";

	interface FontProps {
		color?: string | Color3;
		size?: number;
		face?: string;
		family?: string;
		weight?: string | number;
		transparency?: number;
	}

	interface StrokeProps {
		color?: string | Color3;
		thickness?: number;
		transparency?: number;
		joins?: "round" | "bevel" | "miter";
		sizing?: "fixed" | "scaled";
	}

	interface MarkProps {
		color?: string | Color3;
		transparency?: number;
	}

	interface Format {
		autoEscape: boolean;

		stringify(): string;

		escape(): Format;
		font(props?: FontProps): Format;
		stroke(props?: StrokeProps): Format;
		bold(): Format;
		italic(): Format;
		underline(): Format;
		strike(): Format;
		smallcaps(): Format;
		upper(): Format;
		linebreak(count?: number): Format;
		mark(props?: MarkProps): Format;
		comment(): Format;
	}

	class Format implements Format {
		constructor(raw: unknown);
	}

	const f: (raw: unknown) => Format;
}
