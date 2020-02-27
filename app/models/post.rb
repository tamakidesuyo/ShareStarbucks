class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 , message: "Too short to post!"}
  validates :body, presence: true

  # postsがusersに所属している。かつpostのuser_idは必須
  belongs_to :user
  validates :user_id, presence: true

end
