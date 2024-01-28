-- Basic UI Library

local Library = {}
Library.__index = Library

function Library:Create(title)
    local newLibrary = {}
    setmetatable(newLibrary, self)

    newLibrary.window = Instance.new("ScreenGui")
    newLibrary.window.Name = "MyLibrary"
    newLibrary.window.Parent = game.Players.LocalPlayer:Wait().PlayerGui

    newLibrary.title = Instance.new("TextLabel")
    newLibrary.title.Name = "Title"
    newLibrary.title.Parent = newLibrary.window
    newLibrary.title.BackgroundTransparency = 1
    newLibrary.title.Text = title
    newLibrary.title.TextColor3 = Color3.new(1, 1, 1)
    newLibrary.title.Font = Enum.Font.SourceSansBold
    newLibrary.title.TextSize = 20
    newLibrary.title.Position = UDim2.new(0.5, 0, 0, 10)
    newLibrary.title.AnchorPoint = Vector2.new(0.5, 0)
    newLibrary.title.Size = UDim2.new(0, 200, 0, 50)

    newLibrary.content = Instance.new("Frame")
    newLibrary.content.Name = "Content"
    newLibrary.content.Parent = newLibrary.window
    newLibrary.content.BackgroundTransparency = 1
    newLibrary.content.Position = UDim2.new(0.5, 0, 0, 70)
    newLibrary.content.AnchorPoint = Vector2.new(0.5, 0)
    newLibrary.content.Size = UDim2.new(0, 200, 0, 200)

    newLibrary.addButton = function(self, text, callback, toggle)
        local button = Instance.new("TextButton")
        button.Name = "Button"
        button.Parent = newLibrary.content
        button.BackgroundTransparency = 0.7
        button.Text = text
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Size = UDim2.new(0, 200, 0, 40)
        button.Position = UDim2.new(0, 0, 0, 40 * (#newLibrary.buttons + 1))

        newLibrary.buttons = newLibrary.buttons or {}
        table.insert(newLibrary.buttons, button)

        local isToggled = false

        button.MouseButton1Click:Connect(function()
            if toggle then
                isToggled = not isToggled
                button.BackgroundTransparency = isToggled and 0.3 or 0.7
            end
            callback()
        end)
    end

    return newLibrary
end

return Library
