class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
        

 with_options presence: true do
  validates :nickname
  validates :email
  validates :password
  validates :password_confirmation
  validates :last_name
  validates :first_name
  validates :furigana_first
  validates :furigana_last
  validates :date_of_birth
 end

 with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :last_name
  validates :first_name
 end

 with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
   validates :furigana_last
   validates :furigana_first
 end
end
