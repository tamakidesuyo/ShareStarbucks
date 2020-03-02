class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  # validates :body, presence: true
  #bodyにvalidationをつけるとエラーが出た時@nameが渡されなくなるためつけないことにする

  # postsがusersに所属している。かつpostのuser_idは必須
  belongs_to :user
  validates :user_id, presence: true

   #uploaderでimgカラムと投稿画像を結びつける(carrierwave機能)
  mount_uploader :img, ImgUploader

  #postのstatusが0の時非公開、1の時非公開に設定(デフォルトは非公開(0))
  enum status: {nonreleased: 0, released: 1} 

end
