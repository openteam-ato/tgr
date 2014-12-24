class OpendataController < MainController

  before_filter :find_opendata

  def index
  end

  def show
    respond_to do |format|
      format.csv { send_file @opendata.list.path }
    end
  end

  private

  def find_opendata
    @opendata = Opendata.first
  end

end
