FactoryBot.define do
	factory :user do
		nickname {Faker::Name.initials}
		email {Faker::Internet.free_email}
		password {Faker::Internet.password("aaa111")}
		password_confirmation {password}
		last_name {"山田"}
		first_name {"花子"}
		furigana_last {"ヤマダ"}
		furigana_first {"ハナコ"}
		date_of_birth {"1930-01-01"} 
	end
end