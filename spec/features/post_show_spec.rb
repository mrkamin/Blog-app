require 'rails_helper'
RSpec.describe 'Showing a post details', type: :feature do
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
    @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom Hinns!')
    @second_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom Hinns!')
    @third_comment = Comment.create(post: @fifth_post, author: @first_user, text: 'Hi Tom Hinns!')
    @fourth_comment = Comment.create(post: @sixth_post, author: @first_user, text: 'Hi Tom Hinns!')
    @fifth_comment = Comment.create(post: @sixth_post, author: @first_user, text: 'Hi Tom Hinns!')
    @sixth_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Lilly Fillia!')
    @seventh_comment = Comment.create(post: @second_post, author: @second_user, text: 'Hi Lilly Fillia!')
    @eight_comment = Comment.create(post: @sixth_post, author: @second_user, text: 'Hi Lilly Fillia!')
    @ninth_comment = Comment.create(post: @tenth_post, author: @second_user, text: 'Hi Lilly Fillia!')
    @tenth_comment = Comment.create(post: @fourteenth_post, author: @second_user, text: 'Hi Lilly Fillia!')
    @eleventh_comment = Comment.create(post: @first_post, author: @third_user, text: 'Hi Merkel Damian!')
    @sixteenth_comment = Comment.create(post: @first_post, author: @fourth_user, text: 'Hi Jemimah Bolaji!')
    @first_like = Like.create(author: @first_user, post: @first_post)
    @second_like = Like.create(author: @first_user, post: @first_post)
  end

  scenario 'I can see the post title.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.title)
  end

  scenario ' I can see who wrote the post.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.author.name)
  end

  scenario 'I can see how many comments it has.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(@first_post.comments_counter).to eq(5)
  end

  scenario 'I can see how many likes it has.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(@first_post.likes_counter).to eq(2)
  end

  scenario 'I can see the post body.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.text)
  end

  scenario 'I can see the username of each commentor.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_comment.author.name)
    expect(page).to have_content(@second_comment.author.name)
    expect(page).to have_content(@third_comment.author.name)
    expect(page).to have_content(@fourth_comment.author.name)
    expect(page).to have_content(@fifth_comment.author.name)
  end

  scenario 'I can see the comment each commentor left.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_user.posts.first.comments.first.text)
  end
end