class ChatsController < ApplicationController
  def index
    @my_chats=current_user.chats
    @chat_partners=User.where.not(id:current_user.id)#自分以外
  end

  def show
    chat1 = Chat.where(user_id:current_user.id,partner_id:params[:id])
    chat2 = Chat.where(user_id:params[:id],partner_id:current_user.id)
    @chats = (chat1.or(chat2)).order(:created_at)
    @partner=User.find(params[:id])
  end
end
