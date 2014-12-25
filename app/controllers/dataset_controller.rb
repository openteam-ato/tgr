class DatasetController < MainController

  def show
    respond_to do |format|
      format.csv do
        send_file Opendata.first.list.path
      end
      format.html do
        @dataset = Dataset.find_by_tracking_number(params[:id])
        raise ActionController::RoutingError.new('Not Found') unless @dataset.present?
      end
    end
  end

  def file
    respond_to do |format|
      format.any do
        @dataset = Dataset.find_by_tracking_number(params[:id])
        send_file @dataset.meta.path and return if @dataset.meta_file_name == "#{params[:file]}.#{params[:format]}"
        raise ActionController::RoutingError.new('Not Found') unless @dataset.present?
      end
    end
  end

end
