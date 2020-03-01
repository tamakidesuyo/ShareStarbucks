class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  # postsがusersに所属している。かつpostのuser_idは必須
  belongs_to :user
  validates :user_id, presence: true

   #uploaderでimgカラムと投稿画像を結びつける(carrierwave機能)
  mount_uploader :img, ImgUploader

end
