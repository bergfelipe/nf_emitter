json.extract! nota_fiscal, :id, : usuario_id, : documento_emitente, : inscricao_estadual, : serie, : numero, : data_emissao, : status_autorizacao, : mensagem_autorizacao, : protocolo, : data_autorizacao, : cancelada, : data_cancelamento, : xml_assinado, : resposta_autorizacao, :created_at, :updated_at
json.url nota_fiscal_url(nota_fiscal, format: :json)
