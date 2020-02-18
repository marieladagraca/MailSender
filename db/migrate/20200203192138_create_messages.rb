class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :email
      t.string :to_name
      t.string :from
      t.string :from_name
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
