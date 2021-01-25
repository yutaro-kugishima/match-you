import consumer from "./consumer";

// console.log(consumer);

const hoge = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function (data) {
    //画面を開いているのがチャット送信者だった場合
    if (data["isCurrent_user"] == true) {
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

  // speak: function (sentence) {
  //   debugger;
  //   current_user_id = $("#current_user_id").val();
  //   partner_id = $("#partner_id").val();
  //   return this.perform("speak", {
  //     sentence: sentence,
  //     current_user_id: current_user_id,
  //     partner_id: partner_id,
  //   });
  // },
  speak: function (sentence) {
    const current_user_id = document.getElementById("current_user_id").value;
    const partner_id = document.getElementById("partner_id").value;
    console.log(sentence);
    console.log(current_user_id);
    console.log(partner_id);
    debugger;
    return this.perform("speak", {
      sentence: sentence,
      current_user_id: current_user_id,
      partner_id: partner_id,
    });
  },
});
window.onload = function () {
  document.getElementById("send").onclick = function (e) {
    // debugger;
    console.log("hello");
    const sentence = document.getElementById("sentence").value;
    // debugger;
    console.log(sentence);
    hoge.speak(sentence);
    $("#sentence").val(""); //フォームを空に
    e.preventDefault();
    s;
  };
};
