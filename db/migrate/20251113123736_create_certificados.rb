class CreateCertificados < ActiveRecord::Migration[7.1]
  def change
    create_table :certificados do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.text :pfx_criptografado
      t.text :senha_criptografada

      t.timestamps
    end
  end
end
