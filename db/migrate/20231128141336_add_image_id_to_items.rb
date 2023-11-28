class AddImageIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image_id, :string
  end
end
