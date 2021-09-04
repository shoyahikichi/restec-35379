require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe "ルーム新規作成" do
    it "ルーム名が空だと作成できない" do
      @room.name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include ('チャットルーム名を入力してください')
    end
  end
end
