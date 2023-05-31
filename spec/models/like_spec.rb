require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)

  post = Post.new(
    title: 'Title 1',
    text: 'Text 1',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )
  subject do
    described_class.new(
      author: user,
      post:
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
