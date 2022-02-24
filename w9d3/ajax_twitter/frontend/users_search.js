const APIUtil = require('./twitter_api_util');
const FollowToggle =  require("./follow_toggle.js");

function UsersSearch(el) {
  this.$el = $(el);
  this.$input = this.$el.find(".search-bar")
  this.$ul = this.$el.find(".users")
  //listener for new keys entered into input bar (handleInput callback)
  this.$el.on("keyup", this.handleInput.bind(this));
}

UsersSearch.prototype.handleInput = function(){
  // console.log("you are typing...")
  APIUtil.searchUsers(this.$input.val())
    .then(res => {
      // console.log(res);
      //get users out of results
      // let $users = res.responseJSON;
      this.renderResults(res)
    }) 
}

UsersSearch.prototype.renderResults = function(users){
  this.$ul.empty();

  users.forEach(user => {
    let string = "";
    
    if (user.followed) string = "Unfollow!"
    else string = "Follow!"
    
    let $button = $(`<button>${string}</button>`) //to implement later. Should be a follow toggle plugin

    let $li = $("<li></li>");
    let $a = $("<a></a>");

    $a.attr("href", `/users/${user.id}`);
    $a.html(`${user.username}`);

    $li.append($a);
    $li.append($button);
    this.$ul.append($li);
  })
}

module.exports = UsersSearch;