wait(0.2)
 
game.StarterGui:SetCore("SendNotification", {
    Title = "Umpl Run";
    Text = "Script successfully run | Script in beta mode"; 
    Duration = 5;
})
 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UmplHub", "DarkTheme")
 
local FlyEnabled = false
 
local Tab = Window:NewTab("Start Script")
local Section = Tab:NewSection("Welcome back!.")
Section:NewButton("RunUmpl", "umpl is top", function()
    -- الرسائل التعليمية
    print("Umpl Run!")
    warn("Umpl Run!")
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0) 
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) 
    print("run")
end)
 
local AutoFarmTab = Window:NewTab("Main Games") 
local AutoFarmSection = AutoFarmTab:NewSection("Auto Farm Section") 
 
AutoFarmSection:NewButton("Speed Boost", "Increase player speed", function()
    print("speed boost")
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50 
end)
 
AutoFarmSection:NewToggle("Flight", "Enable or disable flight mode", function(enabled)
    FlyEnabled = enabled
    if enabled then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(3) 
        print("Flight mode enabled")
    else
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11) 
        print("Flight mode disabled")
    end
end)
 
AutoFarmSection:NewButton("Kill Players with Mele/Fruit/Sword", "Kill players with specified weapons", function()
    print("Killing players with Mele/Fruit/Sword...")
    local players = game.Players:GetPlayers()
    for _, player in ipairs(players) do
        local character = player.Character
        if character then
            local humanoid = character.Humanoid
            local tool = character:FindFirstChildWhichIsA("Tool")
            if tool then
                local toolType = tool.Name:lower()
                -- تحقق من نوع الأسلحة: Mele, Fruit, Sword
                if toolType == "mele" or toolType == "fruit" or toolType == "sword" then
                    humanoid:TakeDamage(999999) -- إعطاء ضربة قاتلة للـ Player
                end
            end
        end
    end
end)
 
game:GetService("RunService").Stepped:Connect(function()
    if FlyEnabled then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(3) 
    end
end)
 
