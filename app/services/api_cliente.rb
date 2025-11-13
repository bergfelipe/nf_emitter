require "httparty"

class ApiCliente
  include HTTParty
  base_uri "https://api-nfe-felipet.onrender.com"

  headers "Content-Type" => "application/json"

  def self.teste
    get("/v1/teste")
  end

  def self.emitir_nfe(pfx_base64:, senha:, nota:)
    body = {
      pfx_base64: pfx_base64,
      senha_certificado: senha,
      nota: nota
    }

    response = post("/v1/emissao", body: body.to_json)

    return {
      success: response.code == 200,
      status: response.code,
      body: response.parsed_response
    }
  rescue => e
    return {
      success: false,
      error: e.message
    }
  end

  def self.consultar_notas(cpf)
    response = get("/v1/consulta/#{cpf}")

    {
      success: response.code == 200,
      status: response.code,
      body: response.parsed_response
    }
  rescue => e
    {
      success: false,
      error: e.message
    }
  end
end
