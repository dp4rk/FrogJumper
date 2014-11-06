class AddDetailsToFrogs < ActiveRecord::Migration
  def change
    add_column :frogs, :num_leaves, :int
    add_column :frogs, :river_width, :int
  end
end
