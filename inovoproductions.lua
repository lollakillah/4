-- Inovo Productions Script Hub
-- GitHub: https://github.com/lollakillah/4

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window
local Window = Rayfield:CreateWindow({
  Name = "Inovo Productions",
  Icon = 0,
  LoadingTitle = "Inovo Productions",
  LoadingSubtitle = "Script Hub",
  ShowText = "Inovo",
  Theme = "Ocean",
  ToggleUIKeybind = "K",

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

-- Welcome notification
Rayfield:Notify({
  Title = "Welcome!",
  Content = "Inovo Productions loaded successfully.",
  Duration = 6.5,
  Image = "rewind"
})

-- Create Games tab
local GamesTab = Window:CreateTab("Games", "gamepad-2")
local HomeTab = Window:CreateTab("Home", "home")

-- Game database
local GameScripts = {
  {
    Name = "Arsenal",
    GameId = 286090429,
    Description = "ESP, Aimbot, Silent Aim",
    Script = function()
      Rayfield:Notify({
        Title = "Arsenal",
        Content = "Arsenal script loaded!",
        Duration = 3,
        Image = "check"
      })
      -- Arsenal script functionality here
      print("Arsenal script activated")
    end
  },
  {
    Name = "Prison Life",
    GameId = 155615604,
    Description = "Kill All, Auto Rob, ESP",
    Script = function()
      Rayfield:Notify({
        Title = "Prison Life",
        Content = "Prison Life script loaded!",
        Duration = 3,
        Image = "check"
      })
      -- Prison Life script functionality here
      print("Prison Life script activated")
    end
  }
}

-- Search functionality
local SearchQuery = ""
local FilteredGames = GameScripts

-- Home Tab Content
HomeTab:CreateSection("Welcome to Inovo Productions")

local WelcomeParagraph = HomeTab:CreateParagraph({
  Title = "About",
  Content = "Inovo Productions is a modern script hub for Roblox. Search for your game below and load powerful scripts instantly!"
})

local StatsLabel = HomeTab:CreateLabel("Supported Games: " .. #GameScripts, "bar-chart", Color3.fromRGB(255,255,255), false)

HomeTab:CreateDivider()

HomeTab:CreateSection("Quick Info")

local InfoButton = HomeTab:CreateButton({
  Name = "GitHub Repository",
  Callback = function()
    Rayfield:Notify({
      Title = "Repository",
      Content = "github.com/lollakillah/4",
      Duration = 5,
      Image = "github"
    })
  end
})

-- Games Tab Content
GamesTab:CreateSection("Game Search")

-- Search Input
local SearchInput = GamesTab:CreateInput({
  Name = "Search Games",
  CurrentValue = "",
  PlaceholderText = "Type game name...",
  RemoveTextAfterFocusLost = false,
  Flag = "SearchInput",
  Callback = function(text)
    SearchQuery = text:lower()
    UpdateGameList()
  end
})

GamesTab:CreateDivider()
GamesTab:CreateSection("Available Scripts")

-- Function to update game list based on search
function UpdateGameList()
  -- Filter games based on search query
  FilteredGames = {}
  for _, game in ipairs(GameScripts) do
    if SearchQuery == "" or game.Name:lower():find(SearchQuery) then
      table.insert(FilteredGames, game)
    end
  end
  
  -- Notify user of search results
  if SearchQuery ~= "" then
    Rayfield:Notify({
      Title = "Search Results",
      Content = "Found " .. #FilteredGames .. " game(s)",
      Duration = 2,
      Image = "search"
    })
  end
end

-- Create buttons for each game
for _, game in ipairs(GameScripts) do
  local GameButton = GamesTab:CreateButton({
    Name = game.Name,
    Callback = function()
      game.Script()
    end
  })
  
  local GameInfo = GamesTab:CreateParagraph({
    Title = game.Name .. " Info",
    Content = "Game ID: " .. game.GameId .. " | Features: " .. game.Description
  })
  
  GamesTab:CreateDivider()
end

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings", "settings")

SettingsTab:CreateSection("Interface Settings")

local ThemeDropdown = SettingsTab:CreateDropdown({
  Name = "Theme",
  Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
  CurrentOption = {"Ocean"},
  MultipleOptions = false,
  Flag = "ThemeSelect",
  Callback = function(option)
    Window.ModifyTheme(option[1])
    Rayfield:Notify({
      Title = "Theme Changed",
      Content = "Theme set to " .. option[1],
      Duration = 3,
      Image = "palette"
    })
  end
})

local ToggleKeybind = SettingsTab:CreateKeybind({
  Name = "Toggle UI Keybind",
  CurrentKeybind = "K",
  HoldToInteract = false,
  Flag = "ToggleKeybind",
  Callback = function(isHeld)
    Rayfield:SetVisibility(not Rayfield:IsVisible())
  end
})

SettingsTab:CreateDivider()
SettingsTab:CreateSection("Script Settings")

local AutoExecuteToggle = SettingsTab:CreateToggle({
  Name = "Auto Execute on Join",
  CurrentValue = false,
  Flag = "AutoExecute",
  Callback = function(enabled)
    print("Auto Execute:", enabled)
  end
})

local NotificationsToggle = SettingsTab:CreateToggle({
  Name = "Show Notifications",
  CurrentValue = true,
  Flag = "ShowNotifications",
  Callback = function(enabled)
    print("Notifications:", enabled)
  end
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits", "users")

CreditsTab:CreateSection("Development Team")

local DevParagraph = CreditsTab:CreateParagraph({
  Title = "Created By",
  Content = "Inovo Productions Team | Special thanks to all contributors and users!"
})

local VersionLabel = CreditsTab:CreateLabel("Version: 1.0.0", "info", Color3.fromRGB(255,255,255), false)

CreditsTab:CreateDivider()

CreditsTab:CreateSection("Links & Support")

local DiscordButton = CreditsTab:CreateButton({
  Name = "Join Discord",
  Callback = function()
    Rayfield:Notify({
      Title = "Discord",
      Content = "Discord support coming soon!",
      Duration = 4,
      Image = "message-circle"
    })
  end
})

local GitHubButton = CreditsTab:CreateButton({
  Name = "Visit GitHub",
  Callback = function()
    Rayfield:Notify({
      Title = "GitHub",
      Content = "github.com/lollakillah/4",
      Duration = 5,
      Image = "github"
    })
  end
})

-- Load saved configuration at the end
Rayfield:LoadConfiguration()

