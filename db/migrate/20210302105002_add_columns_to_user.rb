class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :trainer, :boolean
    add_column :users, :bio, :text
    add_column :users, :name, :string
    add_column :users, :zoom_link, :string
  end
end
