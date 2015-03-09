class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :image
      t.string :breed
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
