# class ChatsController < ApplicationController
#   def index
#     @my_chats=current_user.chats
#     @chat_partners=User.where.not(id:current_user.id)#自分以外
#   end

#   def show
#     user_id = cookies.signed[:user_id]
#     @partner=User.find(params[:id])
#     # binding.pry
#     @chats_by_myself=Chat.where(user_id: user_id,partner_id: @partner.id)
#     @chats_by_other=Chat.where(user_id: @partner.id,partner_id: user_id)
#     # binding.pry
#     @chats=@chats_by_myself.or(@chats_by_other)#リレーションオブジェクト達を結合する
#     @chats=@chats.order(:created_at)
#     # binding.pry
#   end
# end
