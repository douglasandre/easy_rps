class CreateTables < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :municipal_inscription
      t.string :name
      t.string :city
      t.string :state
    end

    create_table :users do |t|
      t.string :name
      t.string :cpf
    end

    create_table :sales do |t|
      t.references  :service
      t.references  :user
      t.decimal     :amount, precision: 8, scale: 2
      t.timestamps
    end

    create_table :services do |t|
      t.string :name
      t.string :service_code
    end
  end
end
