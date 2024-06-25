local display = false
local type = ""


RegisterNUICallback("close", function()
	SetDisplay(false)
end)


RegisterNUICallback("emptyValue", function()
  TriggerServerEvent("flow-report:emptyValue")
end)

RegisterNUICallback("typeFeedback", function()
  type = "Feedback Report"
end)

RegisterNUICallback("typeBug", function()
  type = "Bug Report"
end)

RegisterNUICallback("typePlayer", function()
  type = "Player Report" 
end)


RegisterCommand("report",function(source)
  SetDisplay(true)
end)

RegisterNUICallback("reportPlayer", function(values)
  local subject = values['values'][1]
  local information = values['values'][2]

  if (subject == "" or information == "") then
    TriggerServerEvent("flow-report:emptyValue")
  else
    TriggerServerEvent("flow-report:reportLog", values)

    exports["screenshot-basic"]:requestScreenshotUpload(Config.onlyPhoto, "files[]", function(data)
      TriggerServerEvent("flow-report:reportLog",values,json.decode(data).attachments[1].proxy_url,type)
    end)

  end

end)


function SetDisplay(bool)
  display = bool
  SetNuiFocus(bool, bool)
  SendNUIMessage({
      type = "ui",
      status = bool,
  })
end


