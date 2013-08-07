class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.datetime :end_time, default: Time.new(2013, 8, 7, 0, 0, 0)

      t.timestamps
    end
  end
end