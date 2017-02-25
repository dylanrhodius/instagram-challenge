require 'rails_helper'

feature 'image posts' do

  context 'no image posts have been added' do
    scenario 'should display a prompt to add an image post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Post')
      expect(page).not_to have_content('No posts yet')
    end
  end


end
