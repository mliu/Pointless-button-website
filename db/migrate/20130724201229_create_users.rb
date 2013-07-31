class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.datetime :end_time, default: Time.now
      t.integer :clicks, default: 0

      t.timestamps
    end
  end
end
