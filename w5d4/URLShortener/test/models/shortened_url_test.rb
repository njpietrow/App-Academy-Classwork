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
require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
