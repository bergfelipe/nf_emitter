require "test_helper"

class NotaFiscalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nota_fiscal = nota_fiscals(:one)
  end

  test "should get index" do
    get nota_fiscals_url
    assert_response :success
  end

  test "should get new" do
    get new_nota_fiscal_url
    assert_response :success
  end

  test "should create nota_fiscal" do
    assert_difference("NotaFiscal.count") do
      post nota_fiscals_url, params: { nota_fiscal: {  cancelada: @nota_fiscal. cancelada,  data_autorizacao: @nota_fiscal. data_autorizacao,  data_cancelamento: @nota_fiscal. data_cancelamento,  data_emissao: @nota_fiscal. data_emissao,  documento_emitente: @nota_fiscal. documento_emitente,  inscricao_estadual: @nota_fiscal. inscricao_estadual,  mensagem_autorizacao: @nota_fiscal. mensagem_autorizacao,  numero: @nota_fiscal. numero,  protocolo: @nota_fiscal. protocolo,  resposta_autorizacao: @nota_fiscal. resposta_autorizacao,  serie: @nota_fiscal. serie,  status_autorizacao: @nota_fiscal. status_autorizacao,  usuario_id: @nota_fiscal. usuario_id,  xml_assinado: @nota_fiscal. xml_assinado } }
    end

    assert_redirected_to nota_fiscal_url(NotaFiscal.last)
  end

  test "should show nota_fiscal" do
    get nota_fiscal_url(@nota_fiscal)
    assert_response :success
  end

  test "should get edit" do
    get edit_nota_fiscal_url(@nota_fiscal)
    assert_response :success
  end

  test "should update nota_fiscal" do
    patch nota_fiscal_url(@nota_fiscal), params: { nota_fiscal: {  cancelada: @nota_fiscal. cancelada,  data_autorizacao: @nota_fiscal. data_autorizacao,  data_cancelamento: @nota_fiscal. data_cancelamento,  data_emissao: @nota_fiscal. data_emissao,  documento_emitente: @nota_fiscal. documento_emitente,  inscricao_estadual: @nota_fiscal. inscricao_estadual,  mensagem_autorizacao: @nota_fiscal. mensagem_autorizacao,  numero: @nota_fiscal. numero,  protocolo: @nota_fiscal. protocolo,  resposta_autorizacao: @nota_fiscal. resposta_autorizacao,  serie: @nota_fiscal. serie,  status_autorizacao: @nota_fiscal. status_autorizacao,  usuario_id: @nota_fiscal. usuario_id,  xml_assinado: @nota_fiscal. xml_assinado } }
    assert_redirected_to nota_fiscal_url(@nota_fiscal)
  end

  test "should destroy nota_fiscal" do
    assert_difference("NotaFiscal.count", -1) do
      delete nota_fiscal_url(@nota_fiscal)
    end

    assert_redirected_to nota_fiscals_url
  end
end
