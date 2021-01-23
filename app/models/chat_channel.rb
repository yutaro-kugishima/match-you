class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    stream_for user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["sentence"]
      Chat.create!(
        user_id: data["user_id"].to_i,
        partner_id: data["partner_id"].to_i ,
        sentence: data["sentence"]
      )
      #画面を開いているのがチャット送信者だった場合
      ChatChannel.broadcast_to data["user_id"].to_i,
        sentence: data["sentence"],
        partner_id: data["partner_id"],
        isUser: true

      #画面を開いているのがチャット受信者だった場合
      ChatChannel.broadcast_to data["partner_id"].to_i,
        sentence: data["sentence"],
        partner_id: data["partner_id"],
        isUser: false
    end
  end
end