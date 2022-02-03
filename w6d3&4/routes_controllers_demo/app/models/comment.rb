# == Schema Information
#
# Table name: comments
#
#  id                   :bigint           not null, primary key
#  body                 :text             not null
#  commenter_id         :integer          not null
#  commented_artwork_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :author,
    foreign_key: :commenter_id,
    class_name: 'User'

  belongs_to :artwork,
    foreign_key: :commented_artwork_id,
    class_name: 'Artwork'

  has_many :likes,
    as: :likeable

  has_many :likers,
    through: :likes,
    source: :user
end
