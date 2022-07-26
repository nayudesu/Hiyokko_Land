# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'hiyokko@email',
   password: 'password'
)

Member.create!(
  [
    {email: 'airi@test.com', nickname: 'あいちゃん', password: 'password', introduction: '帽子やバックをこども用にハンドメイドすることが趣味です！'},
    {email: 'honomi@test.com', nickname: 'ほのみん', password: 'password', introduction: '妊娠７ヶ月目です♪'},
    {email: 'hinata@test.com', nickname: 'ひなた', password: 'password', introduction: 'よろしくお願いします'},
    {email: 'nayu@test.com', nickname: 'なゆ', password: 'password', introduction: '離乳食などの簡単レシピを紹介しています！'},
    {email: 'eri@test.com', nickname: 'えり', password: 'password', introduction: 'お気に入りの絵本を紹介しています！'},
    {email: 'huziwara@test.com', nickname: '藤原', password: 'password', introduction: '２児の父です。家族全員からだを動かすことが好きです。'},
    {email: 'purin@test.com', nickname: 'プリン', password: 'password', introduction: '１歳児双子（女子）　双子コーデを楽しんでいます♫'},
    {email: 'kotori@test.com', nickname: 'ことり', password: 'password'},
    {email: 'dai@test.com', nickname: 'だいちゃん', password: 'password', introduction: 'お家でできる遊びを紹介しています！'},
    {email: 'kyoko@test.com', nickname: 'きょうこちゃん', password: 'password', introduction: '毎日こどもとダンスを踊ってます〜'},
    {email: 'nana@test.com', nickname: 'nana', password: 'password'},
    {email: 'buru@test.com', nickname: 'ブル', password: 'password', introduction: 'こどもが無事成人を迎えました！子育て中に得た経験を発信します！'},
    {email: 'onishi@test.com', nickname: 'りゅちぇ', password: 'password', introduction: 'インスタ映え情報を発信しています！'},
    {email: 'michi@test.com', nickname: 'みっちー', password: 'password', introduction: '見る専用です'},
    {email: 'omochi@test.com', nickname: 'おもち', password: 'password', introduction: 'サッカーが好きです'},
    {email: 'momo@test.com', nickname: 'モモ', password: 'password'},
    {email: 'usagi@test.com', nickname: 'うさぎ', password: 'password'},
    {email: 'ryu@test.com', nickname: 'りゅう', password: 'password'},
    {email: 'tono@test.com', nickname: 'との', password: 'password'},
    {email: 'meorn@test.com', nickname: 'メロン', password: 'password'},
    {email: 'kiui@test.com', nickname: 'kiui', password: 'password'},
    {email: 'hou@test.com', nickname: 'ほうちゃん', password: 'password'},
    {email: 'papi@test.com', nickname: 'パピー', password: 'password'}
  ]
)

Genre.create!(
  [
    {name: '食事'},
    {name: '遊び'},
    {name: '０歳'},
    {name: '１歳'},
    {name: '２歳'},
    {name: '３歳'},
    {name: '４歳'},
    {name: '５歳'},
    {name: '６歳'},
    {name: '妊婦'},
    {name: '便利グッズ'},
    {name: 'インスタ映え'},
    {name: 'その他'}
  ]
)
