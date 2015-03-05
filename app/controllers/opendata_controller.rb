class OpendataController < MainController

  def show
    @opendata = Opendata.first
    @datasets = @opendata.datasets
    @datasets = @datasets.by_category(params[:dataset][:category]) if params[:dataset].try(:[], :category).present?
    @datasets = @datasets.by_context(params[:dataset][:context]) if params[:dataset].try(:[], :context).present?
    @datasets = @datasets.page(params[:page])
  end

end
