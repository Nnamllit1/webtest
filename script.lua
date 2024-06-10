local button = get(".button")
local outputText = get("outputText")

button.on_click(function()
  outputText.set_content("Button Clicked!")
end)
