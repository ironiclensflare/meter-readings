class AddIconToServices < ActiveRecord::Migration
  def change
    add_column :services, :icon, :string
  end
end
