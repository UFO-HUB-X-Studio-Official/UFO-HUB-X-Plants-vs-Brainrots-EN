local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UFO-HUB-X-Studio-Official/UFO-HUB-X-UI/refs/heads/main/UFO%20HUB%20X%20UI.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")
-- เพิ่มกรอบสีเขียวรอบ UI
task.delay(0.2, function()
    local cg = game:GetService("CoreGui")
    local gui
    for _, g in ipairs(cg:GetChildren()) do
        if g:IsA("ScreenGui") and g:FindFirstChild("Main", true) then
            gui = g
            break
        end
    end
    if not gui then return end

    local GREEN = Color3.fromRGB(0,255,140)

    local function stroke(o, thk, r)
        if not o:IsA("GuiObject") then return end
        local s = o:FindFirstChild("UFOStroke") or Instance.new("UIStroke")
        s.Name = "UFOStroke"
        s.Parent = o
        s.Color = GREEN
        s.Thickness = thk or 2
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.LineJoinMode = Enum.LineJoinMode.Round

        local c = o:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", o)
        c.CornerRadius = UDim.new(0, r or 8)
    end

    -- ใส่กรอบให้ทุก Frame / Button
    for _, o in ipairs(gui:GetDescendants()) do
        if o:IsA("Frame") or o:IsA("ScrollingFrame") or o:IsA("TextButton") or o:IsA("ImageButton") then
            stroke(o, 2, 8)
        end
    end

    -- หน้าต่างหลัก: ทำขอบหนากว่า
    local main = gui:FindFirstChild("Main", true)
    if main then
        stroke(main, 3, 10)
    end
end)
