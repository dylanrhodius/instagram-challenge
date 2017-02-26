require 'rails_helper'

feature 'commenting' do
  before { Post.create caption: 'Caption' }
  # before { Post.create caption: 'Caption', id: 1 }

  scenario 'allows users to comment on posts' do
     visit '/posts'
     click_link 'Comment'
     fill_in "Thoughts", with: "Cool but no pic!"
     click_button 'Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('Cool but no pic!')
  end

end
