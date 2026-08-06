class CreateProviders < ActiveRecord::Migration[8.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :website
      t.string :support_email

      t.timestamps
    end
  end
end
