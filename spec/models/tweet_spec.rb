require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context "ツイートの保存ができる場合" do
      it "画像とテキストがあればツイートは保存される" do  # @tweet.valid?がtrueならパスする
        expect(@tweet).to be_valid 
      end
      it "テキストのみあればツイートは保存される" do
        @tweet.image = ""
        expect(@tweet).to be_valid
      end
    end
    context "ツイートの保存ができない場合" do
     it "テキストがないとツイートは保存できない" do
       @tweet.text = ""
       @tweet.valid?
       expect(@tweet.errors.full_messages).to include("Text can't be blank")
     end
     it "ユーザーが紐づいていないとツイートは保存できない" do
       @tweet.user = nil
       @tweet.valid?
       expect(@tweet.errors.full_messages).to include("User must exist")
     end
    end
  end
end
