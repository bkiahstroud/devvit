puts 'Seeding data...'

pbq = Subdevvit.create(name: 'princess_bride_quotes', description: Faker::Movies::PrincessBride.quote)
cw = Subdevvit.create(name: 'creative_writing', description: Faker::Lorem.sentence)
himymq = Subdevvit.create(name: 'how_i_met_your_mother_quotes', description: Faker::TvShows::HowIMetYourMother.catch_phrase)

Post.create(title: Faker::Movies::PrincessBride.character, text: Faker::Movies::PrincessBride.quote, subdevvit: pbq)
Post.create(title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars, subdevvit: cw)
Post.create(title: Faker::TvShows::HowIMetYourMother.catch_phrase, text: Faker::TvShows::HowIMetYourMother.quote, subdevvit: himymq)
Post.create(title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars, subdevvit: cw)
Post.create(title: Faker::TvShows::HowIMetYourMother.catch_phrase, text: Faker::TvShows::HowIMetYourMother.quote, subdevvit: himymq)
Post.create(title: Faker::Movies::PrincessBride.character, text: Faker::Movies::PrincessBride.quote, subdevvit: pbq)
Post.create(title: Faker::TvShows::HowIMetYourMother.catch_phrase, text: Faker::TvShows::HowIMetYourMother.quote, subdevvit: himymq)
Post.create(title: Faker::Movies::PrincessBride.character, text: Faker::Movies::PrincessBride.quote, subdevvit: pbq)
Post.create(title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars, subdevvit: cw)

puts 'Successfully seeded data!'
