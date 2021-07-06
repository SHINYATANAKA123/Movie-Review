class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.integer :movie_id
      t.integer :user_id
      t.string :poster_path
      t.string :title

      t.timestamps
    end
  end
end
