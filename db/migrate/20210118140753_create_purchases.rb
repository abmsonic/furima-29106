class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user , foregin_key: true
      t.references :item , foregin_key: true
      t.timestamps
    end
  end
end
