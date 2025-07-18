local function OpenUI(data)
    SendNUIMessage({
        action = "openUI",
        data = data
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('closeUI', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterCommand("testui", function(source, args, rawCommand)
    if #args < 1 then
        print("Malo mi argumentow")
        return
    end

    OpenUI(args)
end, false)

RegisterCommand('testinput', function(source, args, rawCommand)
    local data = {}
    local input = lib.inputDialog('Test input', {
        {type = 'input', label = 'Text', required = true, min = 3, max = 50, placeholder = 'PBS'},
        {type = 'number', label = 'Number', required = true, min = 1, max = 10, placeholder = '2137'},
        {type = 'checkbox', label = 'Checkbox', required = true, checked = true},
        {type = 'select', label = 'Select', required = true, options = {
            {label = 'Option 1', value = 'value1'},
            {label = 'Option 2', value = 'value2'},
        }},
        {type = 'multiselect', label = 'Multi Select', required = true, maxSelectedValues = 3, searchable = true, clearable = true, options = {
            {label = 'Option 1', value = 'value1'},
            {label = 'Option 2', value = 'value2'},
            {label = 'Option 3', value = 'value3'},
        }},
        {type = 'slider', label = 'Slider', required = true, icon = 'hashtag', min = 0, max = 100},
        {type = 'color', label = 'Color', required = true, format = 'rgba', default = {r = 255, g = 0, b = 0, a = 255}},
        {type = 'date', label = 'Date', required = true, min = "01/01/1800", max = "12/12/2077"},
        {type = 'date-range', label = 'Date Range', required = true},
        {type = 'time', label = 'Time', required = true, format = 24, default = '21:37'},
        {type = 'textarea', label = 'Textarea', required = true, min = 10, max = 200, placeholder = 'No hejka co tam sie z toba dzieje, skad te zwatpienie...'},
    })

    if input then
        data = {
            input = input[1],
            number = input[2],
            checkbox = input[3],
            select = input[4],
            multiselect = input[5],
            slider = input[6],
            color = input[7],
            date = input[8],
            dateRange = input[9],
            time = input[10],
            textarea = input[11]
        }
    end
    
    if #args > 0 then
        OpenUI(data)
    end
end, false)