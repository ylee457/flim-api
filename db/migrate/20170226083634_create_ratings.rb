class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :point, default: 0
      t.references :flim, foreign_key: true

      t.timestamps
    end
  end
end
