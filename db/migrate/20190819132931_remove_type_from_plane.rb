class RemoveTypeFromPlane < ActiveRecord::Migration[5.2]
  def change
    remove_column :planes, :type
  end
end
