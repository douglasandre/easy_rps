def fill_field(value, size, fill_char = '0', type = 'num')
  value = value.to_s
  if type == 'num'
    value = format_num(value)
  elsif type == 'text'
    value = format_text(value)
  end

  while value.length < size do
    if type == 'num'
      value = fill_char + value
    else
      value << fill_char
    end
  end

  value
end

def format_num(value)
  value.gsub(/[^0-9A-Za-z]/, '')
end

def format_text(value)
  value.parameterize.upcase.gsub('-', ' ').gsub(/[^0-9A-Za-z ]/, '')
end
