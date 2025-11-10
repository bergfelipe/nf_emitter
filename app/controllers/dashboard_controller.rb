class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_notas = current_user.notas_fiscais.count
    @notas_emitidas = current_user.notas_fiscais.order(created_at: :desc).limit(5)
  end
end
