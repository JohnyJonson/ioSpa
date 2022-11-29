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
local DoorsTab = Window:MakeTab({

	Name = "Doors",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
DoorsTab:AddButton({
	Name = "Spawn Paper (Killable)",

	Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


        -- Create entity
        local entityTable = Spawner.createEntity({
            CustomName = "sttTrolling", -- Custom name of your entity
            Model = "rbxassetid://11474403537", -- Can be GitHub file or rbxassetid
            Speed = 700, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            KillRange = 2,
            BackwardsMovement = false,
            BreakLights = true,
            FlickerLights = {
                true, -- Enabled/Disabled
                1, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
        })
        
        
        -----[[  Debug -=- Advanced  ]]-----
        entityTable.Debug.OnEntitySpawned = function()
            print("Entity has spawned:", entityTable)
        end
        
        entityTable.Debug.OnEntityDespawned = function()
            print("Entity has despawned:", entityTable)
        end
        
        entityTable.Debug.OnEntityStartMoving = function()
            print("Entity has started moving:", entityTable)
        end
        
        entityTable.Debug.OnEntityFinishedRebound = function()
            print("Entity has finished rebound:", entityTable)
        end
        
        entityTable.Debug.OnEntityEnteredRoom = function(room)
            print("Entity:", entityTable, "has entered room:", room)
        end
        
        entityTable.Debug.OnLookAtEntity = function()
            print("Player has looked at entity:", entityTable)
        end
        
        entityTable.Debug.OnDeath = function()
            warn("Player has died.")
        end
        ------------------------------------
        
        
        -- Run the created entity
        Spawner.runEntity(entityTable)
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
OrionLib:Init()

