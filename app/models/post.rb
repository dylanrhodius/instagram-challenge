class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :caption, length: { minimum: 1 }, uniqueness: true
end
