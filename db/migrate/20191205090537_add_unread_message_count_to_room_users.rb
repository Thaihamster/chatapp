class AddUnreadMessageCountToRoomUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :room_users, :unread_message_count, :integer, default: 0
  end
end
