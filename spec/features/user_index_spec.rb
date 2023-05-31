require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom Hinns',
                              photo: 'https://c.files.bbci.co.uk/C870/production/_112921315_gettyimages-876284806.jpg', bio: 'I am a teacher from Mexico. I love and value my job, its basically a reflex than an art.')
    @second_user = User.create(name: 'Lilly Fillia',
                               photo: 'https://burst.shopifycdn.com/photos/woman-dressed-in-white-leans-against-a-wall.jpg', bio: 'I am a slutty model from Bahamas. Adding values to brands with my personality and cult-like following. Brand marketing has changed dynamically since i arrived the art. It was made for me.')
    @third_user = User.create(name: 'Merkel Damian',
                              photo: 'https://images.squarespace-cdn.com/content/v1/58d1b3ff1b631bb1893d108d/813f4928-6cc6-4bc8-a4e4-265f94b4d665/matthew-hamilton-tNCH0sKSZbA-unsplash.jpg', bio: 'I am a tech professional from New york. Birthing and amplifying ideas are what my years of tech business has refined me to love. Want to connect? Hit me up guys!. Lets connect.')
    @fourth_user = User.create(name: 'Jemimah Bolaji',
                               photo: 'https://burst.shopifycdn.com/photos/modern-woman-posing-in-city.jpg', bio: 'I am a hollywood actress from San Francisco. I love and value my job, its basically a reflex than an art. Want to connect? Hit me up guys!. Lets connect.')

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