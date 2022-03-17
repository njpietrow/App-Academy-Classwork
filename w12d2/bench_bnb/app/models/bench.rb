# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Bench < ApplicationRecord
  validates :description, :lat, :lng, presence: true

  def self.in_bounds(bounds)
      # google map bounds will be in the following format:
      # {
      #   "northEast"=> {"lat"=>"37.80971", "lng"=>"-122.39208"},
      #   "southWest"=> {"lat"=>"37.74187", "lng"=>"-122.47791"}
      # }

     bounds = {
        northEast: {lat: "36.80971", lng: "-116.39208"},
        southWest: {lat: "32.74187", lng: "-120.47791"}
      }

    Bench.where("lat < ?", bounds[:northEast][:lat])
      .where("lat > ?", bounds[:southWest][:lat])
      .where("lng > ?", bounds[:southWest][:lng])
      .where("lng < ?", bounds[:northEast][:lng])
  end
end
