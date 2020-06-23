user1 = User.create!(email: "test@example.com", password: "password")
user2 = User.create!(email: "hoge@example.com", password: "password")

user1.messages.create!(content: "おはよう")
user2.messages.create!(content: "こんにちは")
user1.messages.create!(content: "こんばんは")
user1.messages.create!(content: "おやすみ")