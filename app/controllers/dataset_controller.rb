class DatasetController < MainController

  def show
    respond_to do |format|
      format.html do
        @dataset = Dataset.find_by_tracking_number(params[:id])
        if request.user_agent.present? && !request.user_agent.match(/http/)
          @dataset.update_column(:visits, @dataset.visits.to_i + 1)
        end
        raise ActionController::RoutingError.new('Not Found') unless @dataset.present?
      end
      format.any do
        send_file Opendata.first.list.path
      end
    end
  end

  def file
    file_name = "#{params[:file]}.#{params[:format]}"
    @dataset = Dataset.find_by_tracking_number(params[:id])
    send_file @dataset.meta.path and return if @dataset.present? && @dataset.meta_file_name == file_name
    raise ActionController::RoutingError.new('Not Found') unless @dataset.present?
    @dataset.attachments.each do |attachment|
      %w[data structure].each do |field|
        send_file attachment.send(field).path and return if attachment.send("#{field}_file_name") == file_name
      end
    end

    raise ActionController::RoutingError.new('Not Found')
  end

end
