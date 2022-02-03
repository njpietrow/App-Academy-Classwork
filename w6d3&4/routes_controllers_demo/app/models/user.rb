# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: 'Artwork',
    dependent: :destroy

  has_many :shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_artworks,
    through: :shares,
    source: :artwork

  has_many :comments,
    foreign_key: :commenter_id,
    class_name: 'Comment',
    dependent: :destroy

  has_many :likes,
    foreign_key: :user_id,
    class_name: 'Like',
    dependent: :destroy

  has_many :liked_comments,
    through: :likes,
    source: :likeable,
    source_type: :Comment

  has_many :liked_artworks,
    through: :likes,
    source: :likeable,
    source_type: :Artwork
    
end
