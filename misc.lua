local misc = {}

function misc.clear_terminal()
    if package.config:sub(1, 1) == "\\" then
        -- Windows
        os.execute("cls")
    else
        -- Unix-based systems
        os.execute("clear")
    end
end

function misc.split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, tonumber(str))
	end
	return t
end


return misc
