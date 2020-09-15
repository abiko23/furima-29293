require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "各項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailの値が不正だと登録できない" do
        @user.email = 'aaabbbccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下であれば登録できない" do
        @user.password = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英数混合でなければでは登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = "aaaaaa"
        #expect(@user).to be_valid
        @user.valid?
        expect(@user.errors.full_messages).to include("Password password は 英数混合6文字以上です")
      end
      it "お名前(全角 last)が空だと登録できない" do
        @user.fullname_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fullname last is invalid")
      end
      it "お名前(全角 first)が空だと登録できない" do
        @user.fullname_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fullname first is invalid")
      end
      it "お名前(全角 last)が全角でないと登録できない" do
        @user.fullname_last = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fullname last is invalid")
      end
      it "お名前(全角 first)が全角でないと登録できない" do
        @user.fullname_first = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fullname first is invalid")
      end
      it "お名前(カナ first)が空だと登録できない" do
        @user.kananame_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kananame first can't be blank")
      end
      it "お名前(カナ last)が空だと登録できない" do
        @user.kananame_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kananame last can't be blank")
      end
      it "お名前(カナ first)がカナでないと登録できない" do
        @user.kananame_first = 'どなるど'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kananame first is invalid")
      end
      it "お名前(カナ last)がカナでないと登録できない" do
        @user.kananame_last = 'とらんぷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kananame last is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end