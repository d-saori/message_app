user_list = [
  { email: "test@example.com", password: "password" },
  { email: "hoge@example.com", password: "password" },
  { email: "fuga@example.com", password: "password" }
]

message_list = [
  { user_id: 1, content: "おはよう" },
  { user_id: 2, content: "こんにちは" },
  { user_id: 1, content: "こんばんは" },
  { user_id: 1, content: "おやすみ" }
]

like_list = [
  { user_id: 2, message_id: 1 },
  { user_id: 3, message_id: 1 },
  { user_id: 1, message_id: 2 },
  { user_id: 3, message_id: 2 },
  { user_id: 3, message_id: 3 },
  { user_id: 2, message_id: 4 }
]

User.create!(user_list)
Message.create!(message_list)
Like.create!(like_list)
puts '初期データの投入に成功しました!'