local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UFO-HUB-X-Studio-Official/UFO-HUB-X-UI/refs/heads/main/UFO%20HUB%20X%20UI.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")
-- ===== Green Border (Scoped to Kavo only) =====
task.delay(0.25, function()
    local cg = game:GetService("CoreGui")

    -- หา ScreenGui ของ Kavo โดยดูว่ามี "Main" อยู่ข้างใน
    local kavoGui
    for _, g in ipairs(cg:GetChildren()) do
        if g:IsA("ScreenGui") and g:FindFirstChild("Main", true) then
            kavoGui = g
            break
        end
    end
    if not kavoGui then return end

    local main = kavoGui:FindFirstChild("Main", true)
    if not main then return end

    local GREEN = Color3.fromRGB(0,255,140)

    local function isButton(o)
        return o:IsA("TextButton") or o:IsA("ImageButton")
    end

    local function shouldStroke(o)
        -- เฉพาะภายใต้ Main เท่านั้น
        if not o:IsDescendantOf(main) then return false end
        -- ต้องเป็นวัตถุ GUI ที่มองเห็นได้
        if not o.Visible then return false end
        -- ข้ามเฟรมโปร่งใสล้วน (ยกเว้นเป็นปุ่ม)
        if (o:IsA("Frame") or o:IsA("ScrollingFrame")) and (o.BackgroundTransparency >= 1) then
            return false
        end
        -- ข้ามวัตถุระบบ/ตัวช่วยตามชื่อที่มักใช้
        local n = string.lower(o.Name)
        if n:find("invis") or n:find("drag") or n:find("container") or n:find("padding") then
            return false
        end
        -- เอาเฉพาะ Frame/ScrollingFrame/ปุ่ม
        return o:IsA("Frame") or o:IsA("ScrollingFrame") or isButton(o)
    end

    local function stroke(o, thk, r)
        local s = o:FindFirstChild("UFOStroke")
        if not s then
            s = Instance.new("UIStroke")
            s.Name = "UFOStroke"
            s.Parent = o
        end
        s.Color = GREEN
        s.Thickness = thk or 2
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.LineJoinMode = Enum.LineJoinMode.Round
        -- มุมมน
        local c = o:FindFirstChildOfClass("UICorner")
        if not c then
            c = Instance.new("UICorner")
            c.Parent = o
        end
        c.CornerRadius = UDim.new(0, r or 8)
    end

    -- ล้างของเก่า (กันซ้อนเส้น)
    for _, s in ipairs(kavoGui:GetDescendants()) do
        if s:IsA("UIStroke") and s.Name == "UFOStroke" then
            s:Destroy()
        end
    end

    -- ใส่กรอบเฉพาะสิ่งที่ผ่านเงื่อนไข
    for _, o in ipairs(main:GetDescendants()) do
        if o:IsA("GuiObject") and shouldStroke(o) then
            pcall(function() stroke(o, 2, 8) end)
        end
    end

    -- ทำกรอบหนาให้ “หน้าต่างหลัก” (Main) เอง
    pcall(function() stroke(main, 3, 10) end)
end)
