require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name、first_name、furigana_last、furigana_first、date_of_birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailは、@を含んでいれば登録できる" do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end
      it "passwordは、６文字以上であれば登録できる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
      it "passwordは、半角英数字混合での入力であれば登録できる" do
        @user.password = "aaa222"
        @user.password_confirmation = "aaa222"
        expect(@user).to be_valid
      end
    end 
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "furigana_lastが空だと登録できない" do
        @user.furigana_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last can't be blank")
      end
      it "furigana-firstが空だと登録できない" do
        @user.furigana_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first can't be blank")
      end
      it "date_of_birthが空だと登録できない" do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが５文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは確認用と相違があると登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end