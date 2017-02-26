require 'rails_helper'

describe Post, type: :model do
  it 'is not valid with an empty caption' do
    post = Post.new(caption: "")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Post.create(caption: "Sick photo")
    post = Post.new(caption: "Sick photo")
    expect(post).to have(1).error_on(:caption)
  end
end
