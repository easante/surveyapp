class AddIpAddressToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :ip_address, :string
  end
end
