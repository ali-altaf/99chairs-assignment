class RemoveLastName < ActiveRecord::Migration
  def change
    remove_column :names, :last_name
  end
end
