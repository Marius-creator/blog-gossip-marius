class AddTimestampToGossips < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :gossips, null: true
    long_ago = DateTime.new(2000, 1, 1)
  Gossip.update_all(created_at: long_ago, updated_at: long_ago)
  change_column_null :gossips, :created_at, false
  change_column_null :gossips, :updated_at, false
  end
end
