class CreateBookCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :book_categories do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
