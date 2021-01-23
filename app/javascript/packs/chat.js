console.log(App);
App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function () {
    // Called when the subscription is ready for use on the server
  },
  disconnected: function () {
    // Called when the subscription has been terminated by the server
  },
  received: function (data) {
    //画面を開いているのがチャット送信者だった場合
    if (data["isUser"] == true) {
      sentence = `<div class='mycomment'><p>${data["sentence"]}</p></div>`;
    }
    //画面を開いているのがチャット受信者だった場合
    else {
      sentence = `<div class='fukidasi'><div class='faceicon'>
      <img src='/assets/profile.png' alt='管理人'></div>
      <div class='chatting'><div class='says'><p>${data["sentence"]}</p>
      </div></div></div>`;
    }
    $("#chats").append(sentence);
  },
  speak: function (sentence) {
    user_id = $("#user_id").val();
    partner_id = $("#partner_id").val();
    return this.perform("speak", {
      sentence: sentence,
      user_id: user_id,
      partner_id: partner_id,
    });
  },
});
// $(function () {
//   $("#send").on("click", function (e) {
//     sentence = $("#sentence").val();
//     console.log(sentence);
//     App.chat.speak(sentence);
//     $("#sentence").val(""); //フォームを空に
//     e.preventDefault();
//   });

// $(function () {
//   $(document).on("click", function (e) {
//     sentence = $("#sentence").val();
//     console.log(sentence);
//     App.chat.speak(sentence);
//     $("#sentence").val(""); //フォームを空に
//     e.preventDefault();
//   });
// });

// $(function () {
//   document.getElementById("send").on("click", function (e) {
//     sentence = $("#sentence").val();
//     console.log(sentence);
//     App.chat.speak(sentence);
//     $("#sentence").val(""); //フォームを空に
//     e.preventDefault();
//   });
// });

// document.getElementById("send").on("click", function (e) {
//   sentence = $("#sentence").val();
//   console.log(sentence);
//   App.chat.speak(sentence);
//   $("#sentence").val(""); //フォームを空に
//   e.preventDefault();
// });

document.getElementById("send").onclick = function () {
  sentence = $("#sentence").val();
  console.log(sentence);
  App.chat.speak(sentence);
  $("#sentence").val(""); //フォームを空に
  e.preventDefault();
};

document.addEventListener("DOMContentLoaded", () => {
  console.log(document.getElementById("hello"));
});
