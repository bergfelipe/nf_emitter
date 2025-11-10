class NotaFiscalsController < ApplicationController
  before_action :set_nota_fiscal, only: %i[ show edit update destroy ]

  # GET /nota_fiscals or /nota_fiscals.json
  def index
    @nota_fiscals = NotaFiscal.all
  end

  # GET /nota_fiscals/1 or /nota_fiscals/1.json
  def show
  end

  # GET /nota_fiscals/new
  def new
    @nota_fiscal = NotaFiscal.new
  end

  # GET /nota_fiscals/1/edit
  def edit
  end

  # POST /nota_fiscals or /nota_fiscals.json
  def create
    @nota_fiscal = NotaFiscal.new(nota_fiscal_params)

    respond_to do |format|
      if @nota_fiscal.save
        format.html { redirect_to @nota_fiscal, notice: "Nota fiscal was successfully created." }
        format.json { render :show, status: :created, location: @nota_fiscal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nota_fiscal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_fiscals/1 or /nota_fiscals/1.json
  def update
    respond_to do |format|
      if @nota_fiscal.update(nota_fiscal_params)
        format.html { redirect_to @nota_fiscal, notice: "Nota fiscal was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @nota_fiscal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nota_fiscal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_fiscals/1 or /nota_fiscals/1.json
  def destroy
    @nota_fiscal.destroy!

    respond_to do |format|
      format.html { redirect_to nota_fiscals_path, notice: "Nota fiscal was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_fiscal
      @nota_fiscal = NotaFiscal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nota_fiscal_params
      params.require(:nota_fiscal).permit(: usuario_id, : documento_emitente, : inscricao_estadual, : serie, : numero, : data_emissao, : status_autorizacao, : mensagem_autorizacao, : protocolo, : data_autorizacao, : cancelada, : data_cancelamento, : xml_assinado, : resposta_autorizacao)
    end
end
