require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "名前が空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ('名前を入力してください')
    end
    it "社員番号が空だと登録できない" do
      @user.employee_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ('社員番号を入力してください')
    end
    it "社員番号が半角数字以外だと登録できない" do
      @user.employee_number = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ('社員番号は数値で入力してください')
    end
    it "Eメールが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ('Eメールを入力してください')
    end
    it 'emailに@が含まれない場合は登録ができない' do
      @user.email = 'abcd.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it "パスワードがからでは登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

  end
end
