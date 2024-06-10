local button = get("button1")
local result = get("result")

button.on_click(function()
  result.set_content("Test")
end)
