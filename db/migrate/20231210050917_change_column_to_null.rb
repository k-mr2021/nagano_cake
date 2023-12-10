class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :select_address, true
  end
end


