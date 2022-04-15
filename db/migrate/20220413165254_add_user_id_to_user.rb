class AddUserIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :UserId, :integer
  end
end
