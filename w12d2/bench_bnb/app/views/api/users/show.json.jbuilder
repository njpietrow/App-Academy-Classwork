# if (@user.id)
#   json.users do
#     json.set! @user.id do
#       json.extract! @user, :id, :username
#     end
#   end
# else
#   json.errors @user.errors

# end

json.partial! 'api/users/user', user: @user
