require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    let!(:user1) do
      User.create(name: 'Akorda Collins', photo_link: '.jpeg',
                  bio: 'Video editor, programmer and HR officer', posts_counter: 0)
    end

    let!(:user2) do
      User.create(name: 'Aisha Walida', photo_link: 'aisha.jpeg',
                  bio: 'she loves to design henna and have fun', posts_counter: 0)
    end

    let!(:post) do
      Post.create(title: 'title', text: 'I dont have a title so I choose any title!',
                  author: user1, likes_counter: 3, comments_counter: 7)
    end

    let!(:comment) { Comment.create(post:, user: user2, text: 'serina is a good girl') }

    it 'increases comments count on the post' do
      expect do
        comment.update_comment_count
        post.reload
      end.to change(post, :comments_counter).by(1)
    end
  end
end
