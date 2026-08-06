class CreateSubscriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.references :provider, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :billing_cycle
t.decimal :monthly_cost, precision: 10, scale: 2
      t.integer :currency
      t.date :next_renewal_on
      t.string :account_email
      t.boolean :mfa_enabled
      t.string :mfa_method
      t.string :credentials_location
      t.text :notes
      t.string :purpose

      t.timestamps
    end
  end
end
