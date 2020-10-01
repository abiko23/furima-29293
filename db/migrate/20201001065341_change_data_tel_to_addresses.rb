class ChangeDataTelToAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :tel, :string, null: false
  end
end
