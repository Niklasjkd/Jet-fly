class AddDescriptionToPlane < ActiveRecord::Migration[5.2]
  def change
    add_column :planes, :description, :string
  end
end
