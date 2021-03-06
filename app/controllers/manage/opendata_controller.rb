class Manage::OpendataController < Manage::ApplicationController

  def index
    @opendata = Opendata.first
  end

  def show
    @opendata = Opendata.first
    redirect_to manage_root_path and return unless @opendata.present?
    require 'csv'
    @datasets = @opendata.datasets.page(params[:page]).per(15)
  end

  def new
    @opendata = Opendata.new
  end

  def create
    @opendata = Opendata.new(params[:opendata])
    if @opendata.save
      redirect_to manage_opendata_path
    else
      render :new
    end
  end

  def edit
    @opendata = Opendata.first
  end

  def update
    @opendata = Opendata.first
    if @opendata.update_attributes(params[:opendata])
      redirect_to manage_opendata_path
    else
      render :edit
    end
  end

end
