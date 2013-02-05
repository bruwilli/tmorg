class AddNetnameToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :netname, :string
    add_index :clubs, :netname, unique: true
  end
end
