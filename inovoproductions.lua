-- Inovo Productions Script Hub
-- GitHub: https://github.com/lollakillah/4

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window with minimal branding
local Window = Rayfield:CreateWindow({
  Name = "Inovo Productions",
  Icon = 0,
  LoadingTitle = "Inovo Productions",
  LoadingSubtitle = "Script Hub",
  ShowText = "Inovo Productions",
  Theme = "DarkBlue",
  ToggleUIKeybind = "K",

  DisableRayfieldPrompts = true,
  DisableBuildWarnings = true,

  ConfigurationSaving = {
    Enabled = true,
    FolderName = "InovoProductions",
    FileName = "InovoHub"
  },

  Discord = {
    Enabled = false,
    Invite = "noinvitelink",
    RememberJoins = true
  },

  KeySystem = false,
  KeySettings = {
    Title = "Inovo Productions",
    Subtitle = "Key System",
    Note = "Get the key from our website",
    FileName = "InovoKey",
    SaveKey = true,
    GrabKeyFromSite = false,
    Key = {"Hello"}
  }
})

-- Create main Games tab (first tab - default view)
local GamesTab = Window:CreateTab("🎮 Games", "gamepad-2")

-- Game database
local GameScripts = {
  {
    Name = "🎯 Arsenal",
    GameId = 286090429,
    Icon = "crosshair",
    Description = "ESP, Aimbot, Silent Aim, No Recoil",
    Features = {"ESP", "Aimbot", "Silent Aim", "No Recoil", "Infinite Ammo"},
    Script = function()
      Rayfield:Notify({
        Title = "Arsenal",
        Content = "Script loaded successfully!",
        Duration = 3,
        Image = "check-circle"
      })
      print("Arsenal script activated")
    end
  },
  {
    Name = "🏢 Prison Life",
    GameId = 155615604,
    Icon = "shield",
    Description = "Kill All, Auto Rob, ESP, Teleports",
    Features = {"Kill All", "Auto Rob", "ESP", "Teleports", "God Mode"},
    Script = function()
      Rayfield:Notify({
        Title = "Prison Life",
        Content = "Script loaded successfully!",
        Duration = 3,
        Image = "check-circle"
      })
      print("Prison Life script activated")
    end
  }
}

-- Search functionality
local SearchQuery = ""
local GameButtons = {}
local GameParagraphs = {}

-- Create search section at the top
GamesTab:CreateSection("🔍 Find Your Game")

-- Search Input
local SearchInput = GamesTab:CreateInput({
  Name = "Search",
  CurrentValue = "",
  PlaceholderText = "Search for games...",
  RemoveTextAfterFocusLost = false,
  Flag = "SearchInput",
  Callback = function(text)
    SearchQuery = text:lower()
    
    -- Filter and show/hide games based on search
    for i, game in ipairs(GameScripts) do
      local gameName = game.Name:lower()
      if SearchQuery == "" or gameName:find(SearchQuery) then
        -- Game matches search - could implement visibility toggle here
      end
    end
    
    if SearchQuery ~= "" then
      Rayfield:Notify({
        Title = "Search",
        Content = "Searching for: " .. text,
        Duration = 1.5,
        Image = "search"
      })
    end
  end
})

GamesTab:CreateDivider()

-- Header for available games
local GameCounter = GamesTab:CreateLabel("📊 " .. #GameScripts .. " Games Available", "activity", Color3.fromRGB(100,200,255), false)

GamesTab:CreateDivider()

-- Create modern game cards
for i, game in ipairs(GameScripts) do
  -- Game section
  GamesTab:CreateSection(game.Name)
  
  -- Game description
  local GameDesc = GamesTab:CreateParagraph({
    Title = "ℹ️ Features",
    Content = game.Description
  })
  table.insert(GameParagraphs, GameDesc)
  
  -- Execute button
  local GameButton = GamesTab:CreateButton({
    Name = "▶️ Execute " .. game.Name:gsub("🎯 ", ""):gsub("🏢 ", ""),
    Callback = function()
      game.Script()
    end
  })
  table.insert(GameButtons, GameButton)
  
  -- Game info label
  local InfoLabel = GamesTab:CreateLabel("Game ID: " .. game.GameId, "info", Color3.fromRGB(150,150,150), false)
  
  GamesTab:CreateDivider()
end

-- Settings Tab
local SettingsTab = Window:CreateTab("⚙️ Settings", "settings")

SettingsTab:CreateSection("🎨 Interface")

local ThemeDropdown = SettingsTab:CreateDropdown({
  Name = "Theme",
  Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
  CurrentOption = {"DarkBlue"},
  MultipleOptions = false,
  Flag = "ThemeSelect",
  Callback = function(option)
    Window.ModifyTheme(option[1])
    Rayfield:Notify({
      Title = "Theme",
      Content = "Applied " .. option[1] .. " theme",
      Duration = 2,
      Image = "palette"
    })
  end
})

local ToggleKeybind = SettingsTab:CreateKeybind({
  Name = "Toggle UI",
  CurrentKeybind = "K",
  HoldToInteract = false,
  Flag = "ToggleKeybind",
  Callback = function(isHeld)
    Rayfield:SetVisibility(not Rayfield:IsVisible())
  end
})

SettingsTab:CreateDivider()
SettingsTab:CreateSection("🔧 Script Options")

local AutoExecuteToggle = SettingsTab:CreateToggle({
  Name = "Auto Execute on Join",
  CurrentValue = false,
  Flag = "AutoExecute",
  Callback = function(enabled)
    print("Auto Execute:", enabled)
  end
})

local NotificationsToggle = SettingsTab:CreateToggle({
  Name = "Notifications",
  CurrentValue = true,
  Flag = "ShowNotifications",
  Callback = function(enabled)
    print("Notifications:", enabled)
  end
})

SettingsTab:CreateDivider()
SettingsTab:CreateSection("ℹ️ Information")

local VersionLabel = SettingsTab:CreateLabel("Version: 1.0.0", "package", Color3.fromRGB(100,200,255), false)
local RepoLabel = SettingsTab:CreateLabel("GitHub: lollakillah/4", "github", Color3.fromRGB(150,150,150), false)

-- Info Tab
local InfoTab = Window:CreateTab("ℹ️ Info", "info")

InfoTab:CreateSection("📖 About Inovo Productions")

local AboutParagraph = InfoTab:CreateParagraph({
  Title = "Welcome!",
  Content = "Inovo Productions is a modern script hub featuring powerful scripts for popular Roblox games. Use the search bar to find your game and execute scripts instantly!"
})

InfoTab:CreateDivider()
InfoTab:CreateSection("🔗 Links")

local GitHubButton = InfoTab:CreateButton({
  Name = "GitHub Repository",
  Callback = function()
    Rayfield:Notify({
      Title = "GitHub",
      Content = "github.com/lollakillah/4",
      Duration = 4,
      Image = "github"
    })
  end
})

local DiscordButton = InfoTab:CreateButton({
  Name = "Discord Server",
  Callback = function()
    Rayfield:Notify({
      Title = "Discord",
      Content = "Coming soon!",
      Duration = 3,
      Image = "message-circle"
    })
  end
})

InfoTab:CreateDivider()
InfoTab:CreateSection("👥 Credits")

local CreditsParagraph = InfoTab:CreateParagraph({
  Title = "Development Team",
  Content = "Created by Inovo Productions. Special thanks to all contributors and the community!"
})

-- Load saved configuration at the end
Rayfield:LoadConfiguration()

