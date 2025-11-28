-- TODO finish tests
--!nocheck
--!nolint UnknownGlobal

return function()
	local formati = require(script.Parent)
	local lib = require(script.Parent)

	it("should export a Format class", function()
		expect(lib.Format).to.be.ok()
	end)
	it("should export a newline", function()
		expect(lib.newline).to.be.a("string")
	end)
	it("should export a format function", function()
		expect(lib.f).to.be.a("function")
	end)

	local function FormatCheckFactory(new: (string) -> formati.Format)
		return function()
			it("should be a Format class", function()
				local newClass = new("raw")
				expect(newClass.autoEscape).to.be.a("boolean")
				expect(newClass.bold).to.be.a("function")
				expect(newClass.comment).to.be.a("function")
				expect(newClass.escape).to.be.a("function")
				expect(newClass.font).to.be.a("function")
				expect(newClass.italic).to.be.a("function")
				expect(newClass.linebreak).to.be.a("function")
				expect(newClass.bold).to.be.a("function")
			end)

			it("should format bold correctly", function()
				local newClass = new("raw")
				local formatted = newClass:bold():stringify()

				expect(formatted).to.equal("<b>raw</b>")
			end)

			it("should format italics correctly", function()
				local newClass = new("raw")
				local formatted = newClass:italic():stringify()

				expect(formatted).to.equal("<i>raw</i>")
			end)

			it("should format underlines correctly", function()
				local newClass = new("raw")
				local formatted = newClass:underline():stringify()

				expect(formatted).to.equal("<u>raw</u>")
			end)

			it("should format strikethroughs correctly", function()
				local newClass = new("raw")
				local formatted = newClass:strike():stringify()

				expect(formatted).to.equal("<s>raw</s>")
			end)

			it("should format uppercase correctly", function()
				local newClass = new("raw")
				local formatted = newClass:upper():stringify()

				expect(formatted).to.equal("<uc>raw</uc>")
			end)

			it("should format smallcaps correctly", function()
				local newClass = new("raw")
				local formatted = newClass:smallcaps():stringify()

				expect(formatted).to.equal("<sc>raw</sc>")
			end)

			it("should format comments correctly", function()
				local newClass = new("raw")
				local formatted = newClass:comment():stringify()

				expect(formatted).to.equal("<!--raw-->")
			end)

			describe("special formatters", function()
				describe("linebreak", function()
					it("should add no newlines if count is below 1", function()
						expect(new("raw"):linebreak(0):stringify()).to.equal("raw")
						expect(new("raw"):linebreak(-1):stringify()).to.equal("raw")
						expect(new("raw"):linebreak(-100):stringify()).to.equal("raw")
					end)

					it("should add 1 newline when no count is specified", function()
						expect(new("raw"):linebreak():stringify()).to.equal("raw<br/>")
					end)

					it("should add the specified number of newlines", function()
						expect(new("raw"):linebreak(0):stringify()).to.equal("raw")
						expect(new("raw"):linebreak(1):stringify()).to.equal("raw<br/>")
						expect(new("raw"):linebreak(2):stringify()).to.equal("raw<br/><br/>")
					end)
				end)

				describe("mark", function()
					it("should support no arguments", function()
						expect(new("raw"):mark():stringify()).to.equal("<mark  >raw</mark>")
					end)
					it("should support color arguments", function()
						expect(new("raw"):mark({ color = Color3.new(1, 1, 1) }):stringify()).to.equal(
							`<mark color="#ffffff" >raw</mark>`
						)
						expect(new("raw"):mark({ color = "rgb(69,69,69)" }):stringify()).to.equal(
							`<mark color="rgb(69,69,69)" >raw</mark>`
						)
					end)
					it("should support transparency arguments", function()
						expect(new("raw"):mark({ transparency = 0.5 }):stringify()).to.equal(
							`<mark  transparency="0.5">raw</mark>`
						)
						expect(new("raw"):mark({ transparency = 0 }):stringify()).to.equal(`<mark  >raw</mark>`)
					end)
					it("should support transparency & color arguments", function()
						expect(new("raw"):mark({ transparency = 0.5, color = Color3.new(1, 1, 1) }):stringify()).to.equal(
							`<mark color="#ffffff" transparency="0.5">raw</mark>`
						)
					end)
				end)

				describe("stroke", function()
					warn("auto PASS for <stroke>, no tests written")
				end)

				describe("font", function()
					warn("auto PASS for <font>, no tests written")
				end)
			end)
		end
	end

	describe("formati.Format", FormatCheckFactory(formati.Format.new))

	describe("formati.f", FormatCheckFactory(formati.f))
end
