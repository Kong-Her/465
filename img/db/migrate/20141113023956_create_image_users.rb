class CreateImageUsers < ActiveRecord::Migration
  def change
    create_table :image_users do |t|
      t.references :image, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
