class AddToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :spoiler, :boolean
  end
end
