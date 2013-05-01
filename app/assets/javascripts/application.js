// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require checkout.js


$(function() {
  if(forge.is.mobile()){
    alert('Hey mobile forge command just worked!');
  }
  if (forge.is.web()){
    alert('Hey web forge command just worked!');
  }
  if (forge.is.desktop()){
    alert('Hey desktop forge command just worked!');
  }

});

// var baseUrl = "http://rkap7-mosaic.fwd.wf/";

// var root = ''
// var filePath = window.location.pathname.split('/');
// var n = filePath.length;
// var folderPath = filePath[n - 2].toString() + '/' + filePath[n - 1].toString();

// if (filePath[n - 2].toString() + '/' + filePath[n - 1].toString() == 'src/index.html') {
//   root = '';
//   //Set topbar title
//   forge.topbar.setTitle('Home');

//   //Set an initial notificationPath for listener
//   var randomTime = '' + new Date().getTime();
//   forge.prefs.set('notifTime', randomTime,
//     forge.logging.log('The initial notifTime has been set to: ' + randomTime));

// } else {
//   root = '../';
// }


// function capitaliseFirstLetter(string)
// {
//     return string.charAt(0).toUpperCase() + string.slice(1);
// }

// //create navigation bar
// $(function () {

//   //TOPBAR configurations
//   if (folderPath == 'src/index.html') {
//     //Set topbar title
//     forge.topbar.setTitle('Home');
    
//   } 


//   forge.topbar.setTint([84,34,219,230]);
  
//   forge.tabbar.removeButtons();
// //create tabbar
//   forge.tabbar.addButton({
//     icon: "img/home.jpg",
//     text: "Home",
//     index: 0
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = root + 'index.html';
//       button.setActive();
      
//     });
//   });

//   forge.tabbar.addButton({
//     icon: "img/books.png",
//     text: "Books",
//     index: 1
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = baseUrl + 'books';
//       button.setActive();
      
      
//     });
//   });

//   forge.tabbar.addButton({
//     icon: "img/patron.png",
//     text: "Patrons",
//     index: 2
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = baseUrl + 'patrons';
//       button.setActive();
      
//     });
//   });

//   forge.tabbar.addButton({
//     icon: "img/checkout.png",
//     text: "Checkout",
//     index: 3
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = baseUrl + 'checkout';
//       button.setActive();
      
//     });
//   });

//   forge.tabbar.addButton({
//     icon: "img/checkin.png",
//     text: "Checkin",
//     index: 4
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = baseUrl + 'checkin';
//       button.setActive();
      
//     });
//   });


//   forge.tabbar.addButton({
//     icon: "img/history.png",
//     text: "History",
//     index: 5
//   }, function (button) {

//     button.onPressed.addListener(function () {     
//       window.location = baseUrl + 'history';
//       button.setActive();
      
//     });
//   });

//   forge.tabbar.setTint([84,34,219,230]);
//   forge.tabbar.setActiveTint([220,78,90,255]);

// });



// var config = {
//     parseAppId: 'GPRsaPH25QbByc9V4e0vlFrfVS9tB2t6l3TpBSZj',
//     parseRestKey: 'Fr3pCLOhnKhO6sfk8QduBymhxPlSw6CaDUcz7sja',
//     streamName: 'library'
// };

// var pushChannel = 'recipients';



// $(function() {

//     forge.partners.parse.push.subscribe(pushChannel,
//       function () {
//         forge.logging.info("subscribed to recipients push notifications!");
//       },
//       function (err) {
//         forge.logging.error("error subscribing to recipients notifications: "+ JSON.stringify(err));
//       }
//     );
// });



// var removal = function(elem) {
//   $(elem).remove();
// };


// var sendPush = function(msg, notificationPath) {
//   var randomTime = '' + new Date().getTime();
//   forge.request.ajax({
//     url: "https://api.parse.com/1/push.json",
//     dataType: "json",
//     type: 'POST',
//     contentType: 'application/json',
//     headers: {
//         'X-Parse-Application-Id': 'GPRsaPH25QbByc9V4e0vlFrfVS9tB2t6l3TpBSZj',
//         'X-Parse-REST-API-Key': 'Fr3pCLOhnKhO6sfk8QduBymhxPlSw6CaDUcz7sja',
//         'Content-Type': 'application/json'
//     },
//     data: JSON.stringify({"channels": [pushChannel],
//         "data": {
//           "alert": msg,
//           "badge": "Increment",
//           "appPath": notificationPath,
//           "notificationTime": randomTime.toString()
//         }
//       }
//     ),
//     success: function (data) {
//       forge.logging.info("push msg sent");
//       forge.logging.info("data: " + data);
//     },
//     error: function (error) {
//       forge.logging.error(JSON.stringify(error));
//     }
//   })
// };

