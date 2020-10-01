class ChangeDefaultTelToAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :tel, :bigint, null: false, zerofill: true
  end
end
