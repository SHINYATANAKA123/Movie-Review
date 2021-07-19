# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:'hiroto',email:'hiroto@example.com',password:'000000',birthday:'1940-01-01',sex:'男',intro:'hirotoです。よろしくお願いします。')
User.create!(name:'souta',email:'souta@example.com',password:'000000',birthday:'1960-01-01',sex:'男',intro:'soutaです。よろしくお願いします。')
User.create!(name:'misaki',email:'misaki@example.com',password:'000000',birthday:'1950-01-01',sex:'女',intro:'misakiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'itsuki',email:'itsuki@example.com',password:'000000',birthday:'1950-01-01',sex:'男',intro:'itsukiです。よろしくお願いします。')
User.create!(name:'sho',email:'sho@example.com',password:'000000',birthday:'1970-01-01',sex:'男',intro:'shoです。よろしくお願いします。')
User.create!(name:'hana',email:'hana@example.com',password:'000000',birthday:'1940-01-01',sex:'女',intro:'hanaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'sakura',email:'sakura@example.com',password:'000000',birthday:'1960-01-01',sex:'女',intro:'sakuraといいます。どうぞよろしくお願いいたします。')
User.create!(name:'hina',email:'hina@example.com',password:'000000',birthday:'1970-01-01',sex:'女',intro:'hinaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'yuto',email:'yuto@example.com',password:'000000',birthday:'1940-01-01',sex:'男',intro:'yutoです。よろしくお願いします。')
User.create!(name:'kana',email:'kana@example.com',password:'000000',birthday:'1980-01-01',sex:'女',intro:'kanaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'aoi',email:'aoi@example.com',password:'000000',birthday:'1990-01-01',sex:'女',intro:'aoiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'rin',email:'rin@example.com',password:'000000',birthday:'1940-01-01',sex:'女',intro:'rinといいます。どうぞよろしくお願いいたします。')
User.create!(name:'shin',email:'shin@example.com',password:'000000',birthday:'1950-01-01',sex:'男',intro:'shinです。よろしくお願いします。')
User.create!(name:'yuma',email:'yuma@example.com',password:'000000',birthday:'1960-01-01',sex:'男',intro:'yumaです。よろしくお願いします。')
User.create!(name:'mirai',email:'mirai@example.com',password:'000000',birthday:'1950-01-01',sex:'女',intro:'miraiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'ren',email:'ren@example.com',password:'000000',birthday:'1990-01-01',sex:'男',intro:'renです。よろしくお願いします。')
User.create!(name:'mao',email:'mao@example.com',password:'000000',birthday:'1960-01-01',sex:'女',intro:'maoといいます。どうぞよろしくお願いいたします。')
User.create!(name:'minato',email:'minato@example.com',password:'000000',birthday:'1980-01-01',sex:'男',intro:'minatoです。よろしくお願いします。')
User.create!(name:'miyu',email:'miyu@example.com',password:'000000',birthday:'1970-01-01',sex:'女',intro:'miyuといいます。どうぞよろしくお願いいたします。')
User.create!(name:'ikko',email:'ikko@example.com',password:'000000',birthday:'1950-01-01',sex:'その他',intro:'ikkoといいます。どうぞよろしくお願いいたします。')

Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'1', total_score:'5.0', body:'お馴染みセガの人気キャラクターを主人公にした作品。見えないくらい早く走る。 大人から子供までみんなで安心して楽しめる映画です。 ジムキャリーファンもあの変顔を存分に楽しめます(ちょっと老けたけど）。 日本も製作に関わってますがテイストは完全にハリウッドです。')
Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'2', total_score:'4.0', body:'実写化は、とても嬉しいけど、ソニックの声優が金丸淳一さんじゃないのは、ちょっとショックかな、、、', tag_list:["かわいい", "笑える"])
Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'3', total_score:'4.5', body:'あのゲームやアニメで有名なソニックが実写で映画化！どんな内容かとても楽しみにしていましたが、大満足の出来でした。')
