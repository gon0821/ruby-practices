# 新電力会社のフィヨルドでんきでは、以下のような料金プランで毎月の電気代を請求している。

# 最低料金 = 10kWhまで300円
# 10kWh超過100kWhまで = 1kWhあたり20円
# 100kWh超過分 = 1kWhあたり30円

# 引数 = その月の電気使用量（単位はkWh、0以上の整数）
# 戻り値 = 料金（単位は円）
def calc_charge(kwh_per_month)
  if  100 < kwh_per_month
    300 + 20 * (100 - 10) + 30 * (kwh_per_month - 100)
  elsif 10 < kwh_per_month && kwh_per_month <= 100
    300 + 20 * (kwh_per_month - 10)
  else
    300
  end
end

puts calc_charge(ARGV[0].to_i)

# 同値クラス
# 0 ~ 10
# 11 ~ 100
# 100 ~

# 0,10,11,100,101
