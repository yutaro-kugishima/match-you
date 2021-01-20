class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :users, null: false
      t.integer :partner_id, null: false #チャット相手
      t.string :sentence, null: false
      t.timestamps
    end
  end
end
