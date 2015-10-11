class AddDescriptionToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :description, :string
  end
end
