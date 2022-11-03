class CreateResearches < ActiveRecord::Migration[7.0]
  def change
    create_table :researches do |t|
      t.integer :user_id
      t.string :title
      t.integer :number_of_auther
      t.integer :year
      t.string :journal
      t.string :patent

      t.timestamps
    end
  end
end
