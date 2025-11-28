--!strict
export type FontProps = {
	color: (string | Color3)?,
	size: number?,
	face: string?,
	family: string?,
	weight: (string | number)?,
	transparency: number?,
}

export type StrokeProps = {
	color: (string | Color3)?,
	thickness: number?,
	transparency: number?,
	joins: ("round" | "bevel" | "miter")?,
	sizing: ("fixed" | "scaled")?,
}

export type MarkProps = {
	color: (string | Color3)?,
	transparency: number?,
}

export type Format = {
	autoEscape: boolean,

	stringify: (self: Format) -> string,

	escape: (self: Format) -> Format,
	font: (self: Format, props: FontProps?) -> Format,
	stroke: (self: Format, props: StrokeProps?) -> Format,
	bold: (self: Format) -> Format,
	italic: (self: Format) -> Format,
	underline: (self: Format) -> Format,
	strike: (self: Format) -> Format,
	smallcaps: (self: Format) -> Format,
	upper: (self: Format) -> Format,
	linebreak: (self: Format, count: number?) -> Format,
	mark: (self: Format, props: MarkProps?) -> Format,
	comment: (self: Format) -> Format,
}

return nil
