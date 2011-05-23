class CreateBrains < ActiveRecord::Migration
  def self.up
    create_table :brains do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :brains
  end
end
