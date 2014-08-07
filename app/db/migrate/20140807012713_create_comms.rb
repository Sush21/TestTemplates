class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|

      t.timestamps
    end
  end
end
