class NotaFiscal < ApplicationRecord
  belongs_to :user
  validates :documento_emitente, :serie, :numero, :data_emissao, presence: true
end
