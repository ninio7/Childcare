#管理者を1人作成
Admin.create!(
    email: 'test@test',
    password: 'aaaaaa'
)


# # ユーザーを5人生成
# (1..5).each do |i|
#     user=Customer.new(email: "test#{i+10}"+"@"+"test",password: 'aaaaaa', name: "山田 太郎#{i}",kana_name: "ヤマダ タロウ#{i}",postal_code: "000-1234",phone_number: "000-8888-8888",address: "東京都千代田区千代田test#{i}")
#     user.save!
# end

#会員を作成
Customer.create!(
    email: "test1"+"@"+"test",
    password: 'aaaaaa',
    name: "山田 太郎",
    kana_name: "やまだ たろう",
    postal_code: "0001234",
    phone_number: "000-8888-8888",
    address: "東京都千代田区千代田test"
)

Customer.create!(
    email: "test2"+"@"+"test",
    password: 'aaaaaa',
    name: "青木 太郎",
    kana_name: "あおき たろう",
    postal_code: "0001234",
    phone_number: "000-8888-8888",
    address: "東京都千代田区千代田test"
)

Customer.create!(
    email: "test3"+"@"+"test",
    password: 'aaaaaa',
    name: "鈴木 太郎",
    kana_name: "すずき たろう",
    postal_code: "0001234",
    phone_number: "000-8888-8888",
    address: "東京都千代田区千代田test"
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
