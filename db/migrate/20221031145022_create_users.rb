class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :identifier, null: false
      t.string :passcode, null: false

      t.timestamps
    end
  end
end
