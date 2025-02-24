module Rainbowable
  def rainbow
    colored_chars = []
    to_s.each_char.map.with_index do |char, count|
      color = 31 + count % 6
      "\e[#{color}m#{char}"
    end.join + "\e[0m"
    # 1. to_sメソッドを使って自分自身の文字列表現を取得する
    # str = self.to_s
    # ループカウンタと、色をつけた文字を順に格納する配列を用意
    # count = 0
    # colored_chars = []

    # 2. 取得した文字列を1文字ずつループ処理する
    # str.each_char do |char|
      # 文字色は31から36まで順に切り替え、最後まで進んだらまた31に戻る
      # color = 31 + count % 6
      # 3. 各文字の手前にANSIエスケープシーケンスを付与する（さらに、その文字を配列に追加する）
      # colored_chars << "\e[#{color}m#{char}"
      # count += 1
    # end
    # 4. 各文字を連結して1つの文字列にする
    # ret = colored_chars.join

    # 5. 最後に文字色をリセットするための\e[0mを付与する
    # ret + "\e[0m"
  end
end
