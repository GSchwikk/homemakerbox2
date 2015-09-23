class AddCategoryIdToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :category_id, :integer
  end
end
