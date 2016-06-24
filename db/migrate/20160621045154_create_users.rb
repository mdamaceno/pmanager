class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 100, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name
      t.string :slug, unique: true
      t.integer :role, default: 0
      t.string :remember_token
      t.string :forget_token
      t.datetime :forget_token_expires_at

      t.timestamps null: false
    end
  end
end
