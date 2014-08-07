class AddInfoToComms < ActiveRecord::Migration
  def change
	add_column :comms , :cinfo,:text
  end
end
