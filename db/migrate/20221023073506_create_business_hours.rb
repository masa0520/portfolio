class CreateBusinessHours < ActiveRecord::Migration[7.0]
  def change
    create_table :business_hours do |t|
      t.integer :day, defalut: 0
      t.integer :open, defalut: 0
      t.integer :close, defalut: 0
      t.integer :off, defalut: 0
      t.timestamps
    end
  end
end
