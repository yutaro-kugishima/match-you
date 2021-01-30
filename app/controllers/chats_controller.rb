class ChatsController < ApplicationController
  def index
    @my_chats=current_user.chats
    @chat_partners=User.where.not(id:current_user.id)#自分以外
  end

  def show
    @chats = Chat.all
    @partner=User.find(params[:id])
  end
end
