class AddNameToComms < ActiveRecord::Migration
  def change
    add_column :comms, :name, :text
  end
end
