class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      

      t.timestamps
    end
  end
end
