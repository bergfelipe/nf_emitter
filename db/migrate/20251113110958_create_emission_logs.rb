class CreateEmissionLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :emission_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :uuid, null: false
      t.jsonb :nota_payload, null: false, default: {}
      t.jsonb :resposta_payload, null: false, default: {}

      t.timestamps
    end

    add_index :emission_logs, :uuid, unique: true
  end
end
