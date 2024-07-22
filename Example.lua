local Fluent = loadstring(game:HttpGet(
  "https://github.com/mr-suno/Fluent/releases/download/1.1.2/main.lua"
))()


-- Optional libraries:

local SaveManager      = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()


-- Creating a Window:

local Window = Fluent:CreateWindow({
   Title       = "Fluent " .. Fluent.Version,    -- Shows the current Fluent version.
   SubTitle    = "by dawid",                     -- Just text next to the title.
   TabWidth    = 200,                            -- The thickness of the side bar. (Recommended: 160-180)
   Size        = UDim2.fromOffset(625, 560),     -- The size of the window. (Recommended: 625, 560 -> For Mobile: 626, 560 / 1.5)
   Acrylic     = false,                          -- Gaussian blur, may be detectable. (Recommended: false)
   Theme       = "Darker",                       -- Choose from: Dark, Darker, Light, Aqua, Amethyst, Rose
   MinimizeKey = Enum.KeyCode.LeftControl
})

local Options = Fluent.Options


-- Creating Tabs:

local Tabs = {
   Main = Window:AddTab({
      Title = "Main",
      Icon  = ""                                 -- Find Icons from: https://lucide.dev
   }),

   Settings = Window:AddTab({
      Title = "Settings",
      Icon  = "settings"
   })
}

Fluent:Notify({
   Title        = "Example Notification",        -- The header, or title of your notification.
   Content      = "This is a notification",      -- Base description, what you want it to be about.
   SubContent   = "Optional Sub-Content",        -- Optional additional text. (Recommended: Don't add this)
   Duration     = 3                              -- In seconds, how long you want the notification to show.
})


-- Creating Tab-Specific Stuff

Tabs.Main:AddParagraph({
   Title   = "Paragraph",
   Content = "This is a..\nMulti-lined paragraph!",
})


Tabs.Main:AddButton({
   Title       = "Example Button",
   Description = "Click me, please!",
   Callback    = function()
      Window:Dialog({
         Title   = "Dialog Title",
         Content = "This is what a dialog would look like.",
         Buttons = {
            -- Create different buttons.

            {
               Title    = "Confirm",
               Callback = function()             -- The callback here is completely optional.
                  
                  -- What you want the button to do, when pressed.

                  print("User confirmed the dialog!")

               end
            },

            {
               Title = "Cancel"
            }
         }
      })
   end
})


local MyToggle = Tabs.Main:AddToggle("Flag", {
    Title       = "Nice Toggle!",
    Description = "Describe your very fancy toggle.",
    Default     = false                          -- Optional flag, useful for pre-setting values.
})

MyToggle:OnChanged(function(Value)
    if MyToggle.Value then                       -- If our toggle is set to true, 
        Window:Dialog({
            Title   = "\u{1F36A}",
            Content = "I appreciate you clicking me, here's a cookie!",
            Buttons = {
                {
                    Title = "Yum."
                }
            }
        })
    end
end)


Tabs.Main:AddSlider("Flag", {
    Title = "A Surprise Slider.",
    Description = "One with real functionality!",
    Default = 16,
    Rounding = 0,                                -- How far back the decimal point goes. (0 being a whole number)
    Min = 16,                                    -- Minimum value for the slider to go.
    Max = 100,                                   -- Maximum value, the slider cannot go past this.
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})


-- New stuff coming soon ...

Window:SelectTab(1)
