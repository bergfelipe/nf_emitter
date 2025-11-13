require "securerandom"

class NotasFiscaisController < ApplicationController
  before_action :set_nota_fiscal, only: %i[edit update destroy]

  def index
    @nota_fiscals = NotaFiscal.all
  end

  def show
    log = EmissionLog.find_by(uuid: params[:id])

    unless log
      redirect_to new_notas_fiscai_path, alert: "Nenhuma emissão recente encontrada."
      return
    end

    @resposta = log.resposta_payload
    @payload_enviado = log.nota_payload
  end

  def new
    @nota_fiscal = NotaFiscal.new
  end

  def edit
  end

  def create
    nota = params.require(:nota).permit!.to_h
    nota["prods"] = normalizar_produtos(nota["prods"])
    cert = CertificadoService.get_certificado(current_user)

    unless cert
      redirect_to new_notas_fiscai_path, alert: "Certificado digital não configurado. Cadastre o PFX antes de emitir."
      return
    end

    payload = {
      pfx_base64: cert[:pfx],
      senha_certificado: cert[:senha],
      nota: nota
    }

    # Toda a responsabilidade de armazenamento permanece na API externa.
    resposta = ApiCliente.emitir_nfe(
      pfx_base64: payload[:pfx_base64],
      senha: payload[:senha_certificado],
      nota: payload[:nota]
    )

    log = current_user.emission_logs.create!(
      nota_payload: payload[:nota],
      resposta_payload: resposta
    )

    redirect_to notas_fiscai_path(log.uuid)
  rescue ActionController::ParameterMissing
    redirect_to new_notas_fiscai_path, alert: "Os dados da nota (params[:nota]) são obrigatórios."
  end

  def update
    if @nota_fiscal.update(nota_fiscal_params)
      redirect_to @nota_fiscal, notice: "Nota fiscal atualizada.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @nota_fiscal.destroy!
    redirect_to notas_fiscais_path, notice: "Nota fiscal removida.", status: :see_other
  end

  private

  def set_nota_fiscal
    @nota_fiscal = NotaFiscal.find(params[:id])
  end

  def nota_fiscal_params
    params.require(:nota_fiscal).permit(:usuario_id, :documento_emitente, :inscricao_estadual, :serie, :numero, :data_emissao, :status_autorizacao, :mensagem_autorizacao, :protocolo, :data_autorizacao, :cancelada, :data_cancelamento, :xml_assinado, :resposta_autorizacao)
  end

  def normalizar_produtos(prods_param)
    return [] unless prods_param

    if prods_param.is_a?(Array)
      prods_param.compact
    else
      prods_param
        .sort_by { |key, _| key.to_i }
        .map { |_, value| value }
    end
  end
end
