class AddLastReadMessageIdToRoomUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :room_users, :last_read_message_id, :integer
  end
end
