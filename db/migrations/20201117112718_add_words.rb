Hanami::Model.migration do
  change do
    create_table :words do
      primary_key :id
      foreign_key :list_id, :lists, on_delete: :cascade, null: false

      column :fluency, Integer, default: 0
      column :origin, String, null: false, size: 100
      column :translation, String, null: false, size: 100
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      column :finished_at, DateTime

      check { fluency <= 100 }
    end
  end
end
