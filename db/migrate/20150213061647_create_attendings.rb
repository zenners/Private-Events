class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_index :attendings, :attendee_id
    add_index :attendings, :attended_event_id
  end
end
