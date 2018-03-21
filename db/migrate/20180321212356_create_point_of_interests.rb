class CreatePointOfInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :point_of_interests do |t|
      t.string :name
      t.integer :x, default: 0
      t.integer :y, default: 0

      t.timestamps
    end
  end
end
