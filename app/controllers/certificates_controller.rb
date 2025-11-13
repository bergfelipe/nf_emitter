class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def show
    @certificado = current_user.certificados.last
  end

  def new
    @certificado = current_user.certificados.last
  end

  def create
    cert_file = params[:certificate_file]
    cert_pass = params[:certificate_password]

    if cert_file.blank? || cert_pass.blank?
      redirect_to new_certificate_path, alert: "Envie o certificado e a senha."
      return
    end

    begin
      # Lê o arquivo bruto
      raw = cert_file.read

      # Validação do arquivo PFX
      OpenSSL::PKCS12.new(raw, cert_pass)

      # Converte para Base64 (o que a API espera)
      pfx_base64 = Base64.strict_encode64(raw)

      # Se já existir certificado, substitui
      certificado = current_user.certificados.last

      if certificado
        certificado.update!(
          nome: cert_file.original_filename,
          pfx_criptografado: CriptografiaService.encrypt(pfx_base64),
          senha_criptografada: CriptografiaService.encrypt(cert_pass)
        )
      else
        current_user.certificados.create!(
          nome: cert_file.original_filename,
          pfx_criptografado: CriptografiaService.encrypt(pfx_base64),
          senha_criptografada: CriptografiaService.encrypt(cert_pass)
        )
      end

      # Marca no usuário que o certificado foi instalado
      current_user.update!(certificate_installed: true)

      redirect_to authenticated_root_path, notice: "Certificado validado e salvo com sucesso."

    rescue OpenSSL::PKCS12::PKCS12Error
      redirect_to new_certificate_path, alert: "Certificado ou senha inválidos."
    rescue => e
      redirect_to new_certificate_path, alert: "Erro ao salvar certificado: #{e.message}"
    end
  end

  def destroy
    # Apaga o certificado do banco
    current_user.certificados.destroy_all

    # Atualiza flag no user
    current_user.update!(certificate_installed: false)

    redirect_to authenticated_root_path, notice: "Certificado removido."
  end
end
