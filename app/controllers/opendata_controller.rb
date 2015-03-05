class OpendataController < MainController

  def show
    @opendata = Opendata.first
    @datasets = @opendata.datasets.page(params[:page])
  end

end
