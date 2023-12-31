--- Files Reader Module
local filesReader = {}

--- @param fileName string
function filesReader.FileExists(fileName)
  local file = io.open(fileName, "r")

  if file then
    file:close()
  end

  return file ~= nil
end

--- @param fileName string
--- @return table<integer, string>
function filesReader:LinesFrom(fileName)
  if not self.FileExists(fileName) then
    return {}
  end

  local lines = {}

  for line in io.lines(fileName) do
    lines[#lines + 1] = line -- append each line to the lines table
  end

  return lines
end

return filesReader