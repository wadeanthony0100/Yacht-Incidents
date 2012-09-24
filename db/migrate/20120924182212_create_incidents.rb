class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.text :body
      t.string :who

      t.timestamps
    end
  end
end
