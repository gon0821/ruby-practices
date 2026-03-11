# 条件
# 1.西暦年が4で割り切れる年は(原則として)閏年。
# 2.ただし、西暦年が100で割り切れる年は(原則として)平年。
# 3.ただし、西暦年が400で割り切れる年は必ず閏年。

def leap?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

puts leap?(ARGV[0].to_i)
