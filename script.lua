local button = get("button1")
local result = get("result")
local press = 1
local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("dkjson")

local webhook_url = "https://discord.com/api/webhooks/1249752568188371085/lOGDGvGYhKpN_uJZWwHXAcg1Bp0FewWNZ5Bnwq05UnbYlZnNxe6ITccLSfIUE_xfy4iI"
local message = {
    content = "Hallo, das ist eine Nachricht von meinem Lua-Skript!"
}

button.on_click(function()
  local body = json.encode(message)
  local response_body = {}

  local res, code, response_headers = http.request{
    url = webhook_url,
    method = "POST",
    headers = {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = tostring(#body)
    },
    source = ltn12.source.string(body),
    sink = ltn12.sink.table(response_body)
  }

  if res and code == 204 then
    print("Nachricht erfolgreich gesendet!")
  else
    print("Fehler beim Senden der Nachricht. HTTP-Code:", code)
  end
  result.set_content(press)
  press = press + 1
end)
