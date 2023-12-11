class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :event_name
      t.integer :user_id
      t.integer :menus_count

      t.timestamps
    end
  end
end
