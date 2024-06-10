local button = get(".button")
local result = get("result")

button.on_click(function()
  result.set_content("Test")
end)
