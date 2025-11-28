--!nocheck
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local testez = require(ReplicatedStorage.DevPackages.testez)

testez.TestBootstrap:run({ ReplicatedStorage.Packages.formati })
