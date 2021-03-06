function validate(input, allowed_values)
  for value = 1, allowed_values, 1 do
    if input == allowed_values[value] then
      return value
    elseif allowed_values[value] == "" then
      error("Invalid input. Valid inputs include: " .. allowed_values)
    end
  end
end

function valid_read(allowed_values)
  validate(read(), allowed_values)
end

function valid_yes_no()
  valid_read({ "y", "n" })
end

function valid_number()
  tonumber(read())
end
