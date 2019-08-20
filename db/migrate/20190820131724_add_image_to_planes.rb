class AddImageToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_column :planes, :image, :string
  end
end
