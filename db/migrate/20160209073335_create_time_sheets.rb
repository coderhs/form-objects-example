class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.integer :required_duration
      t.integer :minimum_duration
      t.integer :actual_duration

      t.timestamps null: false
    end
  end
end
