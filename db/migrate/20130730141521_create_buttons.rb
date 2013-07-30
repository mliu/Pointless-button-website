class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.datetime :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end
