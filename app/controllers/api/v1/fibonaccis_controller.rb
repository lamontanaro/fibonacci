class Api::V1::FibonaccisController < Api::V1::BaseController
  before_action :set_n, only: [:show]

  def show
    if @n >= 0
      serie = fibo
      render json: { serie: serie }, status: 200
    else
      render json: { message: 'Invalid Number' }, status: 400
    end
  end

  private

  def set_n
    @n = params[:n].to_i
  end

  def fibo
    serie = [0, 1]
    return serie.take(@n) if @n < 2
    while serie.length < @n do
      serie << (serie[-1] + serie[-2])
    end
    serie
  end
end
