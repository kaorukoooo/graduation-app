# プリセットタグ（user_id: nil）
preset_tags = [
  # 外見（positive）
  { name: "清潔感がある", tag_type: "外見", sentiment: "positive" },
  # 外見（negative）
  { name: "清潔感が気になる", tag_type: "外見", sentiment: "negative" },
  { name: "身だしなみが気になる", tag_type: "外見", sentiment: "negative" },

  # 性格（positive）
  { name: "話しやすい", tag_type: "性格", sentiment: "positive" },
  { name: "思いやりがある", tag_type: "性格", sentiment: "positive" },
  # 性格（negative）
  { name: "自己中心的", tag_type: "性格", sentiment: "negative" },
  { name: "話を聞かない", tag_type: "性格", sentiment: "negative" },
  { name: "マウントをとる", tag_type: "性格", sentiment: "negative" },
  { name: "感情的になりやすい", tag_type: "性格", sentiment: "negative" },
  { name: "否定的な発言が多い", tag_type: "性格", sentiment: "negative" },

  # 生活習慣（positive）
  { name: "生活リズムが合う", tag_type: "生活習慣", sentiment: "positive" },
  # 生活習慣（negative）
  { name: "金銭感覚が合わない", tag_type: "生活習慣", sentiment: "negative" },
  { name: "食の好みが合わない", tag_type: "生活習慣", sentiment: "negative" },
  { name: "生活リズムが合わない", tag_type: "生活習慣", sentiment: "negative" },
  { name: "休日の過ごし方が合わない", tag_type: "生活習慣", sentiment: "negative" },
  { name: "喫煙が気になる", tag_type: "生活習慣", sentiment: "negative" },

  # 価値観（positive）
  { name: "結婚観が合う", tag_type: "価値観", sentiment: "positive" },
  { name: "家族を大切にしている", tag_type: "価値観", sentiment: "positive" },
  # 価値観（negative）
  { name: "結婚観が合わない", tag_type: "価値観", sentiment: "negative" },
  { name: "仕事への姿勢が合わない", tag_type: "価値観", sentiment: "negative" },
  { name: "価値観が合わない", tag_type: "価値観", sentiment: "negative" },
  { name: "将来のビジョンが合わない", tag_type: "価値観", sentiment: "negative" },
  { name: "子どもへの考えが合わない", tag_type: "価値観", sentiment: "negative" },
]

preset_tags.each do |tag|
  Tag.find_or_create_by!(name: tag[:name], user_id: nil) do |t|
    t.tag_type = tag[:tag_type]
    t.sentiment = tag[:sentiment]
  end
end

puts "プリセットタグ #{Tag.where(user_id: nil).count} 件を作成しました"
