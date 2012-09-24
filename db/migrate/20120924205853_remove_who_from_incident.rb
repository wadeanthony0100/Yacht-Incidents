class RemoveWhoFromIncident < ActiveRecord::Migration
  def up
    remove_column :incidents, :who
  end

  def down
    add_column :incidents, :who, :string
  end
end
