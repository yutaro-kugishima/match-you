class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    # current_user.speak
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create!(sentence: data['chat'], user_id: 3, partner_id: 4)
    # if data["sentence"]
    #   Chat.create!(
    #     user_id: data["current_user_id"].to_i,
    #     partner_id: data["partner_id"].to_i ,
    #     sentence: data["sentence"]
    #   )
    #   #画面を開いているのがチャット送信者だった場合
    #   ChatChannel.broadcast_to data["current_user_id"].to_i,
    #     sentence: data["sentence"],
    #     partner_id: data["partner_id"],
    #     isCurrent_user: true
    #   #画面を開いているのがチャット受信者だった場合
    #   ChatChannel.broadcast_to data["partner_id"].to_i,
    #     sentence: data["sentence"],
    #     partner_id: data["partner_id"],
    #     isCurrent_user: false
  end
end
