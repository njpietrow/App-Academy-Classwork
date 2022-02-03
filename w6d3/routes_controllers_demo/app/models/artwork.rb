class Artwork < ApplicationRecord
  # validates :artist_id, uniqueness: true 
  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: 'User'
end
