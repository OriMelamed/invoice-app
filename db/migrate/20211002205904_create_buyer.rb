class CreateBuyer < ActiveRecord::Migration[6.1]
  def change
    create_table :buyers do |t|
      t.string :username
      t.timestamps
    end
  end
end
