class CriptografiaService
  KEY = ENV["CERT_KEY"]

  def self.encrypt(text)
    crypt.encrypt_and_sign(text)
  end

  def self.decrypt(text)
    crypt.decrypt_and_verify(text)
  end

  private

  def self.crypt
    ActiveSupport::MessageEncryptor.new([KEY].pack("H*"))
  end
end
