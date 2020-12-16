class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,         null:false, default:""
      t.integer :price,        null:false
      t.integer :category_id,     null:false
      t.integer :status_id,       null:false
      t.integer :fee_id, null:false
      t.integer :place_id, null:false
      t.references :user, null:false, foreign_key:true
      t.text     :detail, null:false
      t.integer    :day_id, null:false
      t.timestamps
    end
  end
end
