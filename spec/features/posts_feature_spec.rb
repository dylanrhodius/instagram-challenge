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
      Post.create(caption: 'The caption')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('The caption')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      sign_up_and_in
      visit '/posts'
      click_link 'Post a picture'
      fill_in 'Caption', with: 'The caption'
      click_button 'Post'
      expect(page).to have_content 'The caption'
      expect(current_path).to eq '/posts'
    end
  end

  context 'an invalid post' do
  scenario 'does not let you submit a name that is too short' do
    sign_up_and_in
    visit '/posts'
    click_link 'Post a picture'
    fill_in 'Caption', with: ''
    click_button 'Post'
    expect(page).not_to have_css 'h2', text: 'The caption'
    expect(page).to have_content 'error'
  end
end

  context 'viewing posts' do
  let!(:post){ Post.create(caption:'post') }
    scenario 'lets a user view a restaurant' do
     visit '/posts'
     click_link 'post'
     expect(page).to have_content 'post'
     expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'editing posts' do

    before { Post.create caption: 'Post', id: 1 }
    scenario 'let a user edit a post' do
      sign_up_and_in
      visit '/posts'
      click_link 'Edit Post'
      fill_in 'Caption', with: 'caption'
      click_button 'Update Post'
      click_link 'caption'
      expect(page).to have_content 'caption'
      expect(current_path).to eq '/posts/1'
    end

  end

  context 'deleting posts' do

    before { Post.create caption: 'Caption' }

    scenario 'removes a post when a user clicks a delete link' do
      sign_up_and_in
      visit '/posts'
      click_link 'Delete Caption'
      expect(page).not_to have_content 'Caption'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end
