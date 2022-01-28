# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string
#  long_url   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true

  def self.random_code
    check = true
    while check
      result = SecureRandom.base64(16)
      check = ShortenedUrl.exists?(short_url: check)
    end
    result
  end

  def self.shortened_url_factory(user, long_url)
    short = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: short)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
