import consumer from "./consumer";

const appRoom = consumer.subscriptions.create("ChatChannel", {
  initialized() {
    // console.log("hello1");
  },
  connected() {
    // console.log("hello");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let sentence
    console.log(data)
    const chats = document.getElementById('chats');
    // chats.insertAdjacentHTML('beforeend', data['sentence']);
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"] == true) {
      sentence = `<div class='mycomment'><p>${data["sentence"]}</p></div>`;
      chats.insertAdjacentHTML('beforeend', sentence);
    }
    // //画面を開いているのがチャット受信者だった場合
    else {
      sentence = `<div class='fukidasi'><div class='faceicon'>
      <img src='/assets/profile.png' alt='管理人'></div>
      <div class='chatting'><div class='says'><p>${data["sentence"]}</p>
      </div></div></div>`;
      chats.insertAdjacentHTML('beforeend', sentence);
    }
  },

  speak: function (chat,current_user_id,partner_id) {
    return this.perform('speak', {chat: chat,current_user_id: current_user_id,partner_id: partner_id});
  }
});
//     debugger;
//     this.perform("speak", {
//       sentence: sentence,
//       current_user_id: current_user_id,
//       partner_id: partner_id,
//     });
//   },
// });
// window.onload = function () {
//   debugger;
//   document.getElementById("send").onclick = function (e) {
//     const sentence = document.getElementById("sentence").value;
//     hoge.speak(sentence);
//     // $("#sentence").val(""); //フォームを空に
//     e.preventDefault();
//   };

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    const current_user_id = document.getElementById("current_user_id").value;
    const partner_id = document.getElementById("partner_id").value;
    appRoom.speak(e.target.value,current_user_id,partner_id);
    e.target.value = '';
    e.preventDefault();
  }
})
