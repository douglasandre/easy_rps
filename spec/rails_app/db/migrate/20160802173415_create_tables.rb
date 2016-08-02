class CreateTables < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
    end

    create_table :users do |t|
      t.string :name
    end

    create_table :products do |t|
      t.string :name
    end
  end
end
