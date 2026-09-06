-- grandMA3 Command Panel
-- A small floating UI for frequently used console commands.
--
-- Install this file in the grandMA3 plugins folder, import it into a
-- Plugin pool slot, and run the plugin from the console.

local PANEL_NAME = "Command Panel"
local PANEL_WIDTH = 520
local PANEL_HEIGHT = 300

local function runCommand(command)
    if type(command) ~= "string" or command == "" then
        ErrPrintf("Command Panel: empty command")
        return
    end

    Cmd(command)
end

local function addButton(grid, label, command, color)
    local button = grid:Append("UIButton")
    button.Text = label
    button.TextAlignmentH = "Centre"
    button.TextAlignmentV = "Centre"
    button.Anchors = "0,0,0,0"
    button.AutoStretch = true

    if color then
        button.BackColor = color
    end

    button.Clicked = function()
        runCommand(command)
    end

    return button
end

local function closePanel(panel)
    if panel then
        panel:Close()
    end
end

local function createPanel()
    local display = GetFocusDisplay()
    if not display then
        ErrPrintf("Command Panel: no focused display")
        return
    end

    local panel = display:CreateOverlay({
        name = PANEL_NAME,
        x = 100,
        y = 100,
        w = PANEL_WIDTH,
        h = PANEL_HEIGHT,
        title = PANEL_NAME,
    })

    panel:ClearUIChildren()

    local root = panel:Append("UILayoutGrid")
    root.Columns = 3
    root.Rows = 3
    root.Margin = 12
    root.Spacing = 8

    addButton(root, "GO +", "Go+", {0.12, 0.45, 0.20, 1.0})
    addButton(root, "GO -", "Go-", {0.45, 0.20, 0.12, 1.0})
    addButton(root, "CLEAR", "Clear", {0.45, 0.45, 0.45, 1.0})

    addButton(root, "EXEC 1", "Goto Executor 1", {0.12, 0.30, 0.55, 1.0})
    addButton(root, "EXEC 2", "Goto Executor 2", {0.12, 0.30, 0.55, 1.0})
    addButton(root, "EXEC 3", "Goto Executor 3", {0.12, 0.30, 0.55, 1.0})

    addButton(root, "BLACKOUT", "Blackout On", {0.65, 0.08, 0.08, 1.0})
    addButton(root, "B.O. OFF", "Blackout Off", {0.20, 0.45, 0.20, 1.0})
    addButton(root, "CLOSE", "", {0.30, 0.30, 0.30, 1.0}).Clicked = function()
        closePanel(panel)
    end
end

return createPanel
