const FollowToggle =  require("./follow_toggle.js");

$(() => {
  let $buttons = $("button.follow-toggle");
  const FTButtons = [];

  $buttons.each(function(idx, ele){
    FTButtons.push( new FollowToggle(ele));
  })

  console.log(FTButtons[0]);
})