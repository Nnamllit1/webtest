local button = get("button1")
local result = get("result")
local press = 0

button.on_click(function()
  result.set_content(press)
  press = press + 1
end)
