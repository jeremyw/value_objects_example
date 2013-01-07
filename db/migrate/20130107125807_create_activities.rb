class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :start_hour,    null: false
      t.integer :start_minute,  null: false, default: 0
      t.integer :end_hour,      null: false
      t.integer :end_minute,    null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
