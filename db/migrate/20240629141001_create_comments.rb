class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user,     foreign_key: true
      t.references :post,     foreign_key: true
      t.string :description,  null: false, default: ""

      t.timestamps
    end
  end
end
