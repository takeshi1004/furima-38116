require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空であるとき" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空であるとき" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空であるとき" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameが空であるとき' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空であるとき' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空であるとき' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空であるとき' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'birthdayが空であるとき' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'emailが既に登録されているものと重複しているとき' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@がないとき' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが5字以下のとき' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが129字以上のとき' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordとpassword_confirmationが不一致であるとき' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordに英字が含まれていないとき' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
      end

      it 'passwordに数字が含まれていないとき' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
      end

      it 'passwordに全角が含まれているとき' do
        @user.password = 'ｐassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英字と半角数字の両方を含めて設定してください")
      end

      it 'first_nameが半角であるとき' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end

      it 'last_nameが半角であるとき' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end

      it 'first_name_kanaが半角であるとき' do
        @user.last_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end

      it 'last_name_kanaが半角であるとき' do
        @user.last_name_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end

      it 'first_name_kanaが漢字であるとき' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end

      it 'last_name_kanaが漢字であるとき' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end

      it 'first_name_kanaがひらがなであるとき' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end

      it 'last_name_kanaがひらがなであるとき' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana には全角カナ文字を使用してください")
      end
    end
  end
end
