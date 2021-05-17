require 'rails_helper'

RSpec.describe 'PostImageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image.valid? }

    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post_image.title = ''
        is_expected.to eq false
      end
    end

    context 'imageカラム' do
      it '空欄でないこと' do
        post_image.image = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostImage.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostImage.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostImage.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostImage.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end