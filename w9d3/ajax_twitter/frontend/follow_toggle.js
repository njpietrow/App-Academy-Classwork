const APIUtil = require('./twitter_api_util');

function FollowToggle (el){
  this.$el = $(el);
  this.userId = this.$el.attr("data-user-id");
  this.followState = this.$el.attr("data-initial-follow-state");
  this.render();
  this.$el.on("click", this.handleClick.bind(this));

}

FollowToggle.prototype.render = function(){
  if(this.followState === 'following') {
    this.$el.prop('disabled', true);
    this.followState = 'false'
  } else if(this.followState === 'unfollowing') {
    this.$el.prop('disabled', true);
    this.followState = 'true'
  }

  if(this.followState === "false"){
    this.$el.text("Follow!");
  } else if (this.followState === "true"){
    this.$el.text("Unfollow!");
  }
}

FollowToggle.prototype.toggleFollow = function(){
  if(this.followState === 'false') {
    this.followState = 'true';
    this.$el.prop('disabled', false);
  } else {
    this.followState = 'false';
    this.$el.prop('disabled', false);
  }
  // this.render();
}

FollowToggle.prototype.handleClick = function() {
  if(this.followState === 'false') {
    this.followState = 'following'
    this.render();
    APIUtil.followUser(this.userId).then(this.toggleFollow.bind(this)).then(this.render.bind(this));
  } 
  else {
    this.followState = 'unfollowing'
    this.render();
    APIUtil.unfollowUser(this.userId).then(this.toggleFollow.bind(this)).then(this.render.bind(this));
  }

}
module.exports = FollowToggle;