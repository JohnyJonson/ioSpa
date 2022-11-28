local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "io.Spa HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "iospa"})


local Tab = Window:MakeTab({
	Name = "Blox fruits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "BodyColor"
})
local RE = Instance.new("RemoteEvent", game.ReplicatedStorage)
RE.Name = "clr"
Tab:AddColorpicker({
	Name = "TorsoColor",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
        RE.OnServerEvent:Connect(function()
            game.Players.LocalPlayer.Character.UpperTorso.Color3 = Value
        end)
		RE:FireAllClients(Value)
	end	  
})
Tab:AddTextbox({
	Name = "Kill player",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		Value:Kick("Banned forever!")
	end	  
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]
--[[
Name = <string> - The name of the colorpicker.
Default = <color3> - The default value of the colorpicker.
Callback = <function> - The function of the colorpicker.
]]
Tab:AddBind({
	Name = "Kill",
	Default = Enum.KeyCode.P,
	Hold = true,
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end    
})
Tab:AddToggle({
	Name = "More Health",
	Default = false,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = 1000000
	end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Hold = <bool> - Makes the bind work like: Holding the key > The bind returns true, Not holding the key > Bind returns false.
Callback = <function> - The function of the bind.
]]Tab:AddDropdown({
	Name = "Normal",
	Default = "1",
	Options = {"Delete legs", "Delete your arm"},
	Callback = function(Value)
		print(Value)
	end    
})

--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]
Tab:AddTextbox({
	Name = "Health",
	Default = "10000",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end	  
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]
OrionLib:Init()
