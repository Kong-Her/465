class CreateDois < ActiveRecord::Migration
  def change
    create_table :dois do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :doi

      t.timestamps
    end
  end
end
