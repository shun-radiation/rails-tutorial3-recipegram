class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
