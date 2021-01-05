class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name         , null: false
      t.text       :info         , null: false
      t.integer    :category_id  , null: false
      t.integer    :status_id    , null: false
      t.integer    :ship_fee_id  , null: false
      t.integer    :prefecure_id , null: false
      t.integer    :ship_day_id  , null: false
      t.integer    :price        , null: false
      t.references :user         , foregin_key: true
      t.timestamps
    end
  end
end
