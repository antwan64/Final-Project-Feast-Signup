class CreateUserMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_menu_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
