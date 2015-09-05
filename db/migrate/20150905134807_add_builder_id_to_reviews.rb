class AddBuilderIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :builder_id, :integer
  end
end
