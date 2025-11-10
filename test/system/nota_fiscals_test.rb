require "application_system_test_case"

class NotaFiscalsTest < ApplicationSystemTestCase
  setup do
    @nota_fiscal = nota_fiscals(:one)
  end

  test "visiting the index" do
    visit nota_fiscals_url
    assert_selector "h1", text: "Nota fiscals"
  end

  test "should create nota fiscal" do
    visit nota_fiscals_url
    click_on "New nota fiscal"

    check "Cancelada" if @nota_fiscal. cancelada
    fill_in "Data autorizacao", with: @nota_fiscal. data_autorizacao
    fill_in "Data cancelamento", with: @nota_fiscal. data_cancelamento
    fill_in "Data emissao", with: @nota_fiscal. data_emissao
    fill_in "Documento emitente", with: @nota_fiscal. documento_emitente
    fill_in "Inscricao estadual", with: @nota_fiscal. inscricao_estadual
    fill_in "Mensagem autorizacao", with: @nota_fiscal. mensagem_autorizacao
    fill_in "Numero", with: @nota_fiscal. numero
    fill_in "Protocolo", with: @nota_fiscal. protocolo
    fill_in "Resposta autorizacao", with: @nota_fiscal. resposta_autorizacao
    fill_in "Serie", with: @nota_fiscal. serie
    fill_in "Status autorizacao", with: @nota_fiscal. status_autorizacao
    fill_in "Usuario", with: @nota_fiscal. usuario_id
    fill_in "Xml assinado", with: @nota_fiscal. xml_assinado
    click_on "Create Nota fiscal"

    assert_text "Nota fiscal was successfully created"
    click_on "Back"
  end

  test "should update Nota fiscal" do
    visit nota_fiscal_url(@nota_fiscal)
    click_on "Edit this nota fiscal", match: :first

    check "Cancelada" if @nota_fiscal. cancelada
    fill_in "Data autorizacao", with: @nota_fiscal. data_autorizacao
    fill_in "Data cancelamento", with: @nota_fiscal. data_cancelamento
    fill_in "Data emissao", with: @nota_fiscal. data_emissao
    fill_in "Documento emitente", with: @nota_fiscal. documento_emitente
    fill_in "Inscricao estadual", with: @nota_fiscal. inscricao_estadual
    fill_in "Mensagem autorizacao", with: @nota_fiscal. mensagem_autorizacao
    fill_in "Numero", with: @nota_fiscal. numero
    fill_in "Protocolo", with: @nota_fiscal. protocolo
    fill_in "Resposta autorizacao", with: @nota_fiscal. resposta_autorizacao
    fill_in "Serie", with: @nota_fiscal. serie
    fill_in "Status autorizacao", with: @nota_fiscal. status_autorizacao
    fill_in "Usuario", with: @nota_fiscal. usuario_id
    fill_in "Xml assinado", with: @nota_fiscal. xml_assinado
    click_on "Update Nota fiscal"

    assert_text "Nota fiscal was successfully updated"
    click_on "Back"
  end

  test "should destroy Nota fiscal" do
    visit nota_fiscal_url(@nota_fiscal)
    click_on "Destroy this nota fiscal", match: :first

    assert_text "Nota fiscal was successfully destroyed"
  end
end
