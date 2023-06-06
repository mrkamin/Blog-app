require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  user = User.new(name: 'Tom Hinns', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)
  user.save
  post = Post.new(
    title: 'Title 1',
    text: 'Text 1',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )
  post.save

  describe 'Post GET /index' do
    it 'returns post http success' do
      get "/users/#{user.id}/posts/"
      expect(response).to have_http_status(200)
    end
    it 'renders post template' do
      get "/users/#{user.id}/posts/"
      expect(response).to render_template(:index)
    end
    it 'post respond body with correct place holder' do
      get "/users/#{user.id}/posts/"
      expect(response.body).to include('Tom Hinns')
    end
  end
  describe 'Post GET /show' do
    it 'return success for detail post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'renders post detail template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'post detail respond body with correct place holder' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Tom Hinns')
    end
  end
end
