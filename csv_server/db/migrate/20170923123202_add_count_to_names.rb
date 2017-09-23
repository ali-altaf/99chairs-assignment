class AddCountToNames < ActiveRecord::Migration
  def change
    add_column :names, :first_name_count, :integer, default: 0
  end
end
