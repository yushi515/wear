class Post < ApplicationRecord
    belongs_to :user 
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

    #tweetsテーブルから中間テーブルに対する関連付け
  has_many :post_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  
end
