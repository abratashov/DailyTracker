# frozen_string_literal: true

class CreateAllowlistedJwts < ActiveRecord::Migration[7.1]
  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti, null: false
      t.string :aud # , null: false # If you want to leverage the `aud` claim, add to it a `NOT NULL` constraint
      t.datetime :exp, null: false
      t.references :user, foreign_key: { on_delete: :cascade }, null: false
      t.timestamps null: false
    end

    add_index :allowlisted_jwts, :jti, unique: true
  end
end
