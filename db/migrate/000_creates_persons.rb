class CreatesPersons < ActiveRecord::Migration

  def change
    create_table :persons do |t|
      t.string :name
      t.timestamps
    end
  end

end
