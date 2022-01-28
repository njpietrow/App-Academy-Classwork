# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  visitor_id :integer          not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visit < ApplicationRecord
  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  belongs_to :url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

  def self.record_vist!(user, shortened_url)
    
    # Visit.create!()

  end
end
