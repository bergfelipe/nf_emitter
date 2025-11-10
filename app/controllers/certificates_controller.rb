class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
  end

  def create
    cert_file = params[:certificate_file]
    cert_pass = params[:certificate_password]

    if cert_file.blank? || cert_pass.blank?
      redirect_to new_certificate_path, alert: "Envie o certificado e a senha."
      return
    end

    begin
      raw = cert_file.read
      OpenSSL::PKCS12.new(raw, cert_pass) # valida
      current_user.update!(certificate_installed: true)
      redirect_to authenticated_root_path, notice: "Certificado validado com sucesso. Emissão liberada."
    rescue OpenSSL::PKCS12::PKCS12Error
      redirect_to new_certificate_path, alert: "Certificado ou senha inválidos."
    end
  end

  def destroy
    current_user.update!(certificate_installed: false)
    redirect_to authenticated_root_path, notice: "Certificado removido."
  end
end
