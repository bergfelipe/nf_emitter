class CreateNotaFiscals < ActiveRecord::Migration[7.1]
  def change
    create_table :nota_fiscals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :documento_emitente
      t.string :inscricao_estadual
      t.string :serie
      t.integer :numero
      t.datetime :data_emissao
      t.string :status_autorizacao
      t.string :mensagem_autorizacao
      t.string :protocolo
      t.datetime :data_autorizacao
      t.boolean :cancelada
      t.datetime :data_cancelamento
      t.text :xml_assinado
      t.text :resposta_autorizacao

      t.timestamps
    end
  end
end
