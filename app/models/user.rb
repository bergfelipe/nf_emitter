class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notas_fiscais, class_name: "NotaFiscal", foreign_key: "user_id", dependent: :destroy
  has_many :emission_logs, dependent: :destroy
    has_many :certificados, dependent: :destroy
end
