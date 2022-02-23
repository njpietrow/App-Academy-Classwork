function FollowToggle (el){
  this.$el = $(el);
  this.userId = this.$el.attr("data-user-id");
  this.followState = this.$el.attr("data-initial-follow-state");
  this.render();
}

FollowToggle.prototype.render = function(){
  if(this.followState === "false"){
    this.$el.text("Follow!");
  } else if (this.followState === "true"){
    this.$el.text("Unfollow!");
  }
}

module.exports = FollowToggle;