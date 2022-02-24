/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./twitter_api_util */ "./frontend/twitter_api_util.js");

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

/***/ }),

/***/ "./frontend/twitter_api_util.js":
/*!**************************************!*\
  !*** ./frontend/twitter_api_util.js ***!
  \**************************************/
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        return $.ajax({
                method: "POST",
                url: `/users/${id}/follow`,
                dataType: 'JSON'
          })
    },
  
    unfollowUser: id => {
        return $.ajax({
                method: "DELETE",
                url: `/users/${id}/follow`,
                dataType: 'JSON'
          })
    },

    searchUsers: queryVal => {
         return $.ajax({
                  method: "GET",
                  url: `/users/search`,
                  data: {query: queryVal},
                  dataType: 'JSON'
            })
    }
  };
  
  module.exports = APIUtil;

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./twitter_api_util */ "./frontend/twitter_api_util.js");
const FollowToggle =  __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle =  __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js")

$(() => {
  let $buttons = $("button.follow-toggle");
  const FTButtons = [];

  $buttons.each(function(idx, ele){
    FTButtons.push( new FollowToggle(ele));
  })

  let $search = $(".users-search");

  let nav = new UsersSearch($search[0])
  
  console.log(nav)


  // console.log(FTButtons[0]);
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map