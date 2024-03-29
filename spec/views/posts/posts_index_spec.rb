require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe '#index' do
    before(:each) do
      @user = User.create(name: 'Akorda Collins', bio: 'Undisputed King of DIY', photo_link: 'photo',
                          posts_counter: 0)
      @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post3 = Post.create(title: 'Hi', text: 'How to stay healthy', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: @user.id,
                           comments_counter: 0, likes_counter: 0)
      @post1 = Post.create(title: 'Energy', text: 'How to set the solar system', author_id: @user.id,
                           comments_counter: 0, likes_counter: 0)

      @comment1 = Comment.create(text: 'How to be a con artist', user_id: @user.id, post_id: @post4.id)
      @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
      @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
      @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
      @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
      @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)

      visit user_posts_path(@user)
    end
    it 'displays user information' do
      expect(page).to have_css('img')
      expect(page).to have_content('Akorda')
      expect(page).to have_content('Number of posts: 4')
    end

    it 'displays post information' do
      expect(page).to have_content('Hello')
      expect(page).to have_content('How to make a table')
      expect(page).to have_content('likes: 0')
      expect(page).to have_content('comments: 6')
    end

    it 'display latest comments on a post' do
      expect(page).to have_content('Awesome stuff')
      expect(page).to have_content('Good post!')
      expect(page).to have_content('That is just awful')
      expect(page).to have_content('Great post')
      expect(page).to have_content('How to solve a crime')
      expect(page).not_to have_content('How to be a con artist')
    end

    it 'redirects me to that post\'s show page when clicking on a post' do
      click_link('Hello')
      expect(page).to have_current_path(user_post_path(@user, @post4))
    end

    it 'shows pagination if there are more posts than it can fit on the view' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_link('2', href: "/users/#{@user.id}/posts?page=2")
    end
  end
end
