class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :comments
      t.string :leve
      t.timestamps
      t.string :category
    end
  end
end

