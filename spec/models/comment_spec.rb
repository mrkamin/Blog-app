require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)

  post = Post.new(
    title: 'Title 1',
    text: 'Text 1',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )

  subject(:comment) do
    Comment.new(text: 'TEst comments',
                author: user,
                post:)
  end
  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end
  it 'it is  valid without a comment' do
    comment.text = nil
    expect(comment).to be_valid
  end

  it 'it should update post comment counter' do
    comment.save
    expect(post.comments_counter).to eq(1)
  end
end
