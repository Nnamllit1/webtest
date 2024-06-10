local button = get("button1")
local result = get("result")
local press = 1

local discord_webhook_url = "https://discord.com/api/webhooks/1249752568188371085/lOGDGvGYhKpN_uJZWwHXAcg1Bp0FewWNZ5Bnwq05UnbYlZnNxe6ITccLSfIUE_xfy4iI"

button.on_click(function()
  result.set_content(press)

  -- Send data to Discord Webhook
  local body = "{ \"content\": \"Button pressed " .. press .. " times.\" }"
  local res = fetch({
      url = discord_webhook_url,
      method = "POST",
      headers = { ["Content-Type"] = "application/json" },
      body = body,
  })

  if res and res.status == 204 then
      print("Message sent to Discord successfully.")
  else
      print("Failed to send message to Discord. Status: " .. (res and res.status or "unknown"))
  end

  press = press + 1
end)
