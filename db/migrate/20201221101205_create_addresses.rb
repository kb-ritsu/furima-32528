class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :place_id,             null: false
      t.string :city,                  null: false, default: ""
      t.string :address,               null: false, default:""
      t.string :building,              null: false, default:""
      t.string :phone_number,          null: false, default:""
      t.references :users_item,        null:false,foreign_key: true
      t.string :address_number,        null:false, default:""

      t.timestamps
    end
  end
end
