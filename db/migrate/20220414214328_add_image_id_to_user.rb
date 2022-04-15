class AddImageIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_id, :integer
  end
end
