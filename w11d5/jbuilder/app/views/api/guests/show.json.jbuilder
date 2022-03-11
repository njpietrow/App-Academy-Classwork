# json.extract! @guest, :name, :age, :favorite_color
json.partial! 'guest', guest: @guest

json.gifts do 
  json.array! @guest.gifts do |gift|
    json.extract! gift, :title, :description
  end
end