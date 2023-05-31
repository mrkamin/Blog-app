require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
             posts_counter: 0)
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'it is not valid with negeative number for post counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    user.posts_counter = 'string'
    expect(user).to_not be_valid
  end
  describe '#most_three_recent_post' do
    let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let!(:post1) { Post.new(author: user, text: '1', title: '1') }
    let!(:post2) { Post.new(author: user, text: '2', title: '2') }
    let!(:post3) { Post.new(author: user, text: '3', title: '3') }

    before do
      user.posts = [post1, post2, post3]
      user.save
    end
    it 'returns the three most recent posts' do
      expect(user.latest_three_posts).to eq([post3, post2, post1])
    end
  end
end
