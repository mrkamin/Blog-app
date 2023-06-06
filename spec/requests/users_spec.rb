require 'rails_helper'
RSpec.describe 'Users', type: :request do
  user = User.new(name: 'Tom Hinns',
                  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Anything test',
                  posts_counter: 0)
  user.save

  describe 'User GET /index' do
    it 'returns user http success' do
      get '/users/'
      expect(response).to have_http_status(200)
    end
    it 'renders user template' do
      get '/users/'
      expect(response).to render_template(:index)
    end
    it 'post respond body with correct place holder' do
      get "/users/#{user.id}/posts/"
      expect(response.body).to include('Tom Hinns')
   
    end
  end
  describe 'User GET /show' do
    it 'return success for detail user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end
    it 'renders user detail template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'post detail respond body with correct place holder' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Tom Hinns')
    end
  end
end
