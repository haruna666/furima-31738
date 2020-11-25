FactoryBot.define do
	factory :user do
		nickname {Faker::Name.initials}
		email {Faker::Internet.free_email}
		password {Faker::Internet.password(min_length:6)}
		password_confirmation {password}
		last_name {Faker::Internet}
		first_name {Faker::Internet}
		furigana_last {Faker::Internet}
		furigana_first {Faker::Internet}
		date_of_birth {Faker::Internet} 
	end
end