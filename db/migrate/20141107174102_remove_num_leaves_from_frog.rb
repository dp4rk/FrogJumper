class RemoveNumLeavesFromFrog < ActiveRecord::Migration
  def change
    remove_column :frogs, :num_leaves
  end
end
