class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end

    add_foreign_key :connections, :users
    add_index :connections, [:uid, :provider], unique: true
  end
end
