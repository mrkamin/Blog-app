require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://unsplash.com/.jpg', bio: 'Teacher from Mexico.')
    @second_user = User.create(name: 'Lilly Fillia',
                               photo: 'https://unsplash.com/.jpg', bio: 'I am a slutty model from Bahamas.')
    @third_user = User.create(name: 'Merkel Damian',
                              photo: 'https://unsplash.com/.jpg', bio: 'I am a tech professional from New york. ')
    @fourth_user = User.create(name: 'Jemimah Bolaji',
                               photo: 'https://unsplash.com/.jpg', bio: 'I am a hollywood actress from San Francisco.')

    @first_post = Post.create(author: @first_user, title: 'Hi Kadarshians', text: 'This is my first post')
    @second_post = Post.create(author: @first_user, title: 'Hi Ashimolowos...', text: 'This is my second post')
    @third_post = Post.create(author: @first_user, title: 'Hi Benjamins...', text: 'This is my third post')
    @fourth_post = Post.create(author: @first_user, title: 'Hi Ugboajas...', text: 'This is my fourth post')
    @fifth_post = Post.create(author: @second_user, title: 'Hello Bourgoiers...', text: 'This is my fifth post')
  end

  scenario 'I can see the username of all other users.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path
    expect(@first_user.photo).to match(%r{^https?://.*\.(jpe?g|gif|png)$})
  end

  scenario 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    expect(@first_user.posts_counter).to eq(4)
  end

  scenario 'When I click on a user, I am redirected to that user show page.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_link @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
  end
end
