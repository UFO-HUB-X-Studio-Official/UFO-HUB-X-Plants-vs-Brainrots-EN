local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UFO-HUB-X-Studio-Official/UFO-HUB-X-UI/refs/heads/main/UFO%20HUB%20X%20UI.lua"))()
-- ตัวอย่างสร้าง 4 แท็บ
local t1 = Window:NewTab("หน้าหลัก")
local t2 = Window:NewTab("ฟาร์ม")
local t3 = Window:NewTab("เทเลพอร์ท")
local t4 = Window:NewTab("ตั้งค่า")

-- ใส่เนื้อหาในหน้าแท็บ (เติมอะไรก็ได้ลงใน t1.Container)
do
    local box = Instance.new("TextLabel", t1.Container)
    box.Size = UDim2.new(1,0,0,36)
    box.BackgroundColor3 = BG_INNER
    box.BorderSizePixel = 0
    corner(box,10); stroke(box,1,MINT,0.35)
    box.Text = "👋 ยินดีต้อนรับสู่ UFO HUB X"
    box.Font = Enum.Font.Gotham; box.TextSize = 14; box.TextColor3 = TEXT_WHITE
end
