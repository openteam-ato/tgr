class OpendataController < MainController

  def show
    @opendata = Opendata.first
  end

end
