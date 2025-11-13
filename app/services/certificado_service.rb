class CertificadoService
  def self.get_certificado(user)
    cert = user.certificados.last
    return nil unless cert

    {
      pfx: CriptografiaService.decrypt(cert.pfx_criptografado),
      senha: CriptografiaService.decrypt(cert.senha_criptografada)
    }
  end
end
