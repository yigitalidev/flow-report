RegisterNetEvent("flow-report:emptyValue")
AddEventHandler("flow-report:emptyValue", function()
    color = { 255, 0, 0},
    TriggerClientEvent('chat:addMessage', source, 'Subject and Information is empty value')
end)

RegisterNetEvent("flow-report:reportLog")
AddEventHandler("flow-report:reportLog", function(values,img,type)
    
    subject = values['values'][1] 
    information = values['values'][2]


        
        function reportLogTypeFedback(author,text)
            url = Config.webhookFeedback
        
            author = subject
            text = information
            
    
            local embeds = {
                {
                    ["title"] = author,
                    ["type"] = "rich",
                    ["color"] = 16711680,
                    ["description"] =  ""..text.."\n Type : "..type,

                    ["image"] = {
                        ["url"] = img
                    },
                    ["footer"] = {
                        ["text"] = "created by flow development"
                    },
                }
            }
            PerformHttpRequest(url, function(err,text,headers) end, 'POST', json.encode({username=Config.logName,embeds=embeds}), { ["Content-Type"] = 'application/json'})
        end

        function reportLogTypeBug(author,text)
            url = Config.webhookBug
        
            author = subject
            text = information
            
    
            local embeds = {
                {
                    ["title"] = author,
                    ["type"] = "rich",
                    ["color"] = 16711680,
                    ["description"] =  ""..text.."\n Type : "..type,

                    ["image"] = {
                        ["url"] = img
                    },
                    ["footer"] = {
                        ["text"] = "created by flow development"
                    },
                }
            }
            PerformHttpRequest(url, function(err,text,headers) end, 'POST', json.encode({username=Config.logName,embeds=embeds}), { ["Content-Type"] = 'application/json'})
        end


        function reportLogTypePlayer(author,text)
            url = Config.webhookPlayer
        
            author = subject
            text = information
            
    
            local embeds = {
                {
                    ["title"] = author,
                    ["type"] = "rich",
                    ["color"] = 16711680,
                    ["description"] =  ""..text.."\n Type : "..type,

                    ["image"] = {
                        ["url"] = img
                    },
                    ["footer"] = {
                        ["text"] = "created by flow development"
                    },
                }
            }
            PerformHttpRequest(url, function(err,text,headers) end, 'POST', json.encode({username=Config.logName,embeds=embeds}), { ["Content-Type"] = 'application/json'})
        end
        
        if type == "Feedback Report" then
            reportLogTypeFedback()
            else if type == "Bug Report" then
                reportLogTypeBug()
            else if type == "Player Report" then
                reportLogTypePlayer()
            else if type== "" then
                TriggerClientEvent('chat:addMessage', source, 'Please Select Report Type')
                end
            end
        end
    end

end)
