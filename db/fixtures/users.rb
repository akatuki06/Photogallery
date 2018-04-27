User.seed do |s|
	s.id = 1
	s.email = "1@gmail.com"
	s.name = "イチジ"
	s.password = "vvvvvv"
	s.is_artist = true
	s.image = Rails.root.join("db/fixtures/images/pic_1.jpg").open
end

User.seed do |s|
	s.id = 2
	s.email = "2@gmail.com"
	s.name = "ニジ"
	s.password = "vvvvvv"
	s.is_artist = true
end

User.seed do |s|
	s.id = 3
	s.email = "3@gmail.com"
	s.name = "サンジ"
	s.password = "vvvvvv"
	s.is_artist = true
end

User.seed do |s|
	s.id = 4
	s.email = "4@gmail.com"
	s.name = "ヨンジ"
	s.password = "vvvvvv"
	s.is_artist = true
end

User.seed do |s|
	s.id = 5
	s.email = "5@gmail.com"
	s.name = "ゴジ"
	s.password = "vvvvvv"
	s.is_artist = true
end

User.seed do |s|
	s.id = 6
	s.email = "6@gmail.com"
	s.name = "ロクジ"
	s.password = "vvvvvv"
	s.is_artist = false
end