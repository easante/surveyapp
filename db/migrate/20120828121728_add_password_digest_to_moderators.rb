class AddPasswordDigestToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :password_digest, :string
  end
end
