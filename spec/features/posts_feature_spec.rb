require 'rails_helper'

feature 'image posts' do
  context 'no image posts have been added' do
    scenario 'should display a prompt to add an image post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post a picture'
    end
  end
end
