class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.integer :roast_beef_pans
      t.integer :chicken_pans
      t.integer :salad_pans
      t.integer :vegetable_pans
      t.integer :user_id
      t.integer :event_id
      t.integer :rice_pans
      t.string :sweet_potato_pans
      t.integer :dessert_pans

      t.timestamps
    end
  end
end
