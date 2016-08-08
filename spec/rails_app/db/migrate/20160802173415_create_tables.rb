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
      t.integer     :rps_item_id
      t.timestamps null: false
    end

    create_table :services do |t|
      t.string :name
      t.string :service_code
    end

    create_table :rps do |t|
      t.integer     :first_item_id
      t.integer     :last_item_id
      t.string      :issuer_type
      t.integer     :issuer_id
      t.date        :start_date
      t.date        :end_date
      t.text        :printed_text
      t.timestamps null: false
    end
    
  end
end
