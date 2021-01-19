class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.string :external_id, index: {unique: true}
      t.string :uri

      t.timestamps
    end
  end
end
