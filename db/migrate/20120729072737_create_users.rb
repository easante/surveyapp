class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender
      t.integer :age
      t.string :region
      t.string :occupation
      t.string :population
      t.string :ip_address

      t.timestamps
    end
  end
end
