local https = require("ssl.https")
local ltn12 = require("ltn12")

local button = get("button1")
local result = get("result")
local press = 1

local webhook_url = "https://discord.com/api/webhooks/1249752568188371085/lOGDGvGYhKpN_uJZWwHXAcg1Bp0FewWNZ5Bnwq05UnbYlZnNxe6ITccLSfIUE_xfy4iI"

local function send_to_discord(message)
  local payload = string.format('{"content":"%s"}', message)
  local response_body = {}

  local res, code, response_headers, status = https.request{
    url = webhook_url,
    method = "POST",
    headers = {
      ["Content-Type"] = "application/json",
      ["Content-Length"] = #payload
    },
    source = ltn12.source.string(payload),
    sink = ltn12.sink.table(response_body)
  }

  if code == 200 then
    print("Message sent successfully")
  else
    print("Failed to send message, HTTP response code: " .. code)
  end
end

button.on_click(function()
  result.set_content(press)
  send_to_discord("Button was pressed " .. press .. " times.")
  press = press + 1
end)
