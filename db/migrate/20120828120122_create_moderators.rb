class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.string :name

      t.timestamps
    end
  end
end
