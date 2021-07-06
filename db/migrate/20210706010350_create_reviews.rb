class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.float :total_score
      t.integer :user_id
      t.integer :movie_id
      t.string :title
      t.string :poster_path

      t.timestamps
    end
  end
end
