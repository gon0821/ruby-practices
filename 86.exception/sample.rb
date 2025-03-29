require 'date'

def to_date(string)
  begin
    Date.parse(string)
  rescue ArgumentError
    nil
  end
end

puts to_date('2025-03-08').class
