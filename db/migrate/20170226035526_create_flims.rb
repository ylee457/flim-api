class CreateFlims < ActiveRecord::Migration[5.0]
  def change
    create_table :flims do |t|
      t.string :title
      t.string :description
      t.string :url_slug
      t.date :year

      t.timestamps
    end
  end
end
