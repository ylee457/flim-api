class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :flim, foreign_key: true, index: true
      t.references :matched_flim, index: true
    end

    add_foreign_key :matches, :flims, column: :matched_flim_id
    add_index :matches, [:flim_id, :matched_flim_id], unique: true
  end
end
