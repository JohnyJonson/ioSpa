-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Background.Name = "Background"
Background.Parent = ScreenGui
Background.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Background.BorderColor3 = Color3.fromRGB(81, 86, 74)
Background.BorderSizePixel = 11
Background.Position = UDim2.new(0.0113285277, 0, 0.0687919483, 0)
Background.Size = UDim2.new(0.0113285277, 0, 0.807047069, 0)
Background.ZIndex = 0

UIGridLayout.Parent = Background
UIGridLayout.FillDirection = Enum.FillDirection.Vertical
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 100, 0, 27)
UIGridLayout.StartCorner = Enum.StartCorner.TopRight

-- Module Scripts:

local fake_module_scripts = {}

do -- Background.Library
	local Script = Instance.new('ModuleScript', Background)
	Script.Name = "Library"
	local function module_script()
		local Library = {}
		local TweenService = game:GetService("TweenService")
		local Background = script.Parent
		function Library:TweenLoad()
			Background:TweenSize(UDim2.new(0.305, 0,0.807, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1.23, true)
		end
		function Library:CreateButton(Text : string, ButtonName, CallBack)
			local Button = Instance.new("TextButton")
			Button.Parent = script.Parent
			Button.Name = ButtonName
			Button.Text = Text
			Button.TextColor3 = Color3.new(0, 1, 0.584314)
			Button.BackgroundColor3 = Color3.new(0.435294, 0.435294, 0.435294)
			if Library:TweenLoad() then
				Button.Visible = false
				wait(2)
				Button.Visible = true
			end
			Button.Activated:Connect(CallBack)
		end
		task.wait(1)
		Library:TweenLoad()
		
		
		return Library
		
	end
	fake_module_scripts[Script] = module_script
end


-- Scripts:

local function TZOJU_fake_script() -- Background.LocalScript 
	local script = Instance.new('LocalScript', Background)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	local Library = require(Background.Library)
	task.wait(5)
	Library:TweenLoad()
	Library:CreateButton("Btn-Text", "AllFruits", function()
		print("Pressed")
	end)
end
coroutine.wrap(TZOJU_fake_script)()
