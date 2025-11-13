class EmissionLog < ApplicationRecord
  belongs_to :user

  before_validation :ensure_uuid

  validates :uuid, presence: true, uniqueness: true
  validates :nota_payload, :resposta_payload, presence: true

  private

  def ensure_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
