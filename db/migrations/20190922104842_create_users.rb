# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :email, String, null: false, unique: true
      column :hashed_pass, String, null: false
      column :password_reset_sent_at, Time
      column :token, String
      column :role, String
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
