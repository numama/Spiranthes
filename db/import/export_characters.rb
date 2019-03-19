require 'csv'

characters = Character.all

characters_csv = CSV.generate do |csv|
  # モデルにcolumn_names でカラム名一覧の配列を取得
  column_names = characters.column_names
  csv << column_names

  characters.each do |character|
    # モデルにattributesでハッシュに変換する
    # ハッシュのvaluesは値だけの配列を返す
    column_values = character.attributes.values
    csv << column_values
  end
end

File.open("db/import/data/characters.csv", "w") do |file|
  file.write(characters_csv)
end