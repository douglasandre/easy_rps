def fill_field(value, size, fill_char = '0', type = 'num')
  value = value.to_s
  while value.length < size do
    if type == 'num'
      value = fill_char + value
    else
      value << fill_char
    end
  end
  value
end