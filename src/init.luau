--!strict
--[[
    authors: raine

    With partial compliation from roblox-ts v3.0.0
]]
local types = require(script.types)
export type Format = types.Format
export type FormatiFontProps = types.FontProps
export type FormatiStrokeProps = types.StrokeProps
export type FormatiMarkProps = types.MarkProps

-- Newline character
local newline = "<br/>"

--- Format class
local Format = setmetatable({}, {
	__tostring = function()
		return "Format"
	end,
})
Format.__index = Format

function Format.new(raw: unknown)
	local self = setmetatable({}, Format)

	return (self:constructor(raw) or self) :: Format
end

function Format.constructor(self: any, raw)
	self._font = false
	self._stroke = false
	self._bold = false
	self._italics = false
	self._under = false
	self._strike = false
	self._uppercase = false
	self._smallcaps = false
	self._mark = false
	self._linebreak = false
	self._comment = false
	self.autoEscape = true

	if typeof(raw) == "string" then
		self._raw = raw
	else
		error(`Formatting for type {typeof(raw)} not unsupported`)
	end

	getmetatable(self).__tostring = self:stringify()
end

function Format.stringify(self: any)
	if self.autoEscape then
		self:escape()
	end

	local formatted = self._raw

	if self._stroke then
		local _value = self._stroke.tr
		local transparencyString = if _value ~= 0 and _value == _value and _value then `tr="{self._stroke.tr}"` else ""
		local _result
		local _value_1 = self._stroke.color
		if _value_1 ~= "" and _value_1 then
			local _color = self._stroke.color
			_result =
				`"color="{if type(_color) == "string" then self._stroke.color else "#" .. self._stroke.color:ToHex()}"`
		else
			_result = ""
		end
		local colorString = _result
		local _value_2 = self._stroke.th
		local thicknessString = if _value_2 ~= 0
				and _value_2 == _value_2
				and _value_2
			then `th="{self._stroke.th}"`
			else ""
		local joinsString = if self._stroke.joins then `joins="{self._stroke.joins}"` else ""
		local sizingString = if self._stroke.sizing then `sizing="{self._stroke.sizing}"` else ""
		formatted =
			`<stroke {colorString} {transparencyString} {thicknessString} {joinsString} {sizingString}>{formatted}</stroke>`
	end
	if self._bold then
		formatted = `<b>{formatted}</b>`
	end
	if self._italics then
		formatted = `<i>{formatted}</i>`
	end
	if self._under then
		formatted = `<u>{formatted}</u>`
	end
	if self._strike then
		formatted = `<s>{formatted}</s>`
	end
	if self._uppercase then
		formatted = `<uc>{formatted}</uc>`
	end
	if self._smallcaps then
		formatted = `<sc>{formatted}</sc>`
	end
	if self._mark then
		local transparency = self._mark.transparency
		local transparencyString = if transparency
				and transparency > 0
				and transparency == transparency
				and transparency <= 1
			then `transparency="{transparency}"`
			else ""

		local color = self._mark.color
		local colorString = if color ~= "" and color
			then `color="{if type(color) == "string" then self._mark.color else "#" .. self._mark.color:ToHex()}"`
			else ""

		formatted = `<mark {colorString} {transparencyString}>{formatted}</mark>`
	end

	-- Special implementation, since there's no real way to do proper line breaks... we just have this
	if self._linebreak then
		local linebreakCount = self._linebreak
		if linebreakCount ~= 0 and linebreakCount == linebreakCount and linebreakCount and linebreakCount > 0 then
			formatted = formatted .. string.rep(newline, self._linebreak)
		end
	end

	if self._comment then
		formatted = `<!--{formatted}-->`
	end

	return formatted
end

function Format.escape(self: any): Format
	self.autoEscape = false
	self._raw = self._raw:gsub("<", "&lt;")
	self._raw = self._raw:gsub(">", "&gt;")
	self._raw = self._raw:gsub('"', "&quot;")
	self._raw = self._raw:gsub("'", "&apos;")
	self._raw = self._raw:gsub("&", "&amp;")

	return self
end

function Format.font(self: any, props: FormatiFontProps?)
	self._font = props or {}

	return self
end

function Format.stroke(self: any, props: FormatiStrokeProps?)
	self._stroke = props or {}

	return self
end

function Format.bold(self: any)
	self._bold = true

	return self
end

function Format.italic(self: any)
	self._italics = true

	return self
end

function Format.underline(self: any)
	self._under = true

	return self
end

function Format.strike(self: any)
	self._strike = true

	return self
end

function Format.upper(self: any)
	self._uppercase = true

	return self
end

function Format.smallcaps(self: any)
	self._smallcaps = true

	return self
end

function Format.mark(self: any, props: FormatiMarkProps?)
	self._mark = props or {}

	return self
end

function Format.linebreak(self: any, count: number?)
	self._linebreak = count or 1

	return self
end

function Format.comment(self: any)
	self._comment = true

	return self
end

-- Format function
local function f(raw: unknown): Format
	return Format.new(raw)
end

-- Exports
return {
	Format = Format :: { new: (raw: unknown) -> Format },
	newline = newline,
	f = f,
}
