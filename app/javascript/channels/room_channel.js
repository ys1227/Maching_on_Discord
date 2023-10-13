import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
// 「const appRoom =」を追記
const appRoom = consumer.subscriptions.create("RoomChannel", {
  // 省略

  received(data) {
    console.log(data)
    const messages = document.getElementById("messages");
    console.log(messages)
    messages.insertAdjacentHTML('beforeend', data['body']);
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value); // メッセージを送信
    e.target.value = ''; // テキストボックスをクリア
    e.preventDefault(); // デフォルトのキー操作を抑制
  }
});
})
