class AddImageToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :image, :string
  end
end
