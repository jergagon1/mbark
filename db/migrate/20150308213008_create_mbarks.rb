class CreateMbarks < ActiveRecord::Migration
  def change
    create_table :mbarks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
