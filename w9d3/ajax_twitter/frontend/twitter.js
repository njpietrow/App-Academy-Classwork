const FollowToggle =  require("./follow_toggle.js");
const UsersSearch = require("./users_search.js")

$(() => {
  let $buttons = $("button.follow-toggle");
  const FTButtons = [];

  $buttons.each(function(idx, ele){
    FTButtons.push( new FollowToggle(ele));
  })

  console.log(FTButtons[0]);
})