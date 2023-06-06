require 'rails_helper'

RSpec.describe 'Showing all posts', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://unsplash.com/.jpg', bio: 'Teacher from Mexico.')
    @second_user = User.create(name: 'Lilly Fillia',
                               photo: 'https://unsplash.com/.jpg', bio: 'I am a slutty model from Bahamas.')
    @third_user = User.create(name: 'Merkel Damian',
                              photo: 'https://unsplash.com/.jpg', bio: 'I am a tech professional from New york.')
    @fourth_user = User.create(name: 'Jemimah Bolaji',
                               photo: 'https://unsplash.com/.jpg', bio: 'I am a hollywood actress from San Francisco.')

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

  scenario 'I can see the user profile picture.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(@first_user.photo).to match(%r{^https?://.*\.(jpe?g|gif|png)$})
  end

  scenario 'I can see the user username.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.name)
  end

  scenario 'I can see the number of posts the user has written.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(@first_user.posts_counter).to eq(4)
  end

  scenario 'I can see a post title.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.title)
  end

  scenario 'I can see some of the post body.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.text)
  end

  scenario 'I can see the first comments on a post.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_post.comments.first.text)
  end

  scenario 'I can see how many comments a post has.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(@first_post.comments_counter).to eq(5)
  end

  scenario 'I can see how many likes a post has.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(@first_post.likes_counter).to eq(2)
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    click_link 'See all posts'
    visit user_posts_path(@first_user)
    expect(page).to have_content('Page 1')
  end

  scenario 'When I click on a post, it redirects me to that post show page.' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    click_on @first_user.name
    visit user_path(@first_user.id)
    expect(page).to have_content(@first_user.name)
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.title)
  end
end
