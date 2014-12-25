class Manage::DatasetsController < Manage::ApplicationController

  def show
    @dataset = Dataset.find(params[:id])
  end

  def new
    @dataset = Dataset.new(:opendata_id => Opendata.first.id)
  end

  def create
    @dataset = Dataset.new(params[:dataset])
    if @dataset.save
      redirect_to manage_opendata_dataset_path(@dataset)
    else
      render :new
    end
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end

  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update_attributes(params[:dataset])
      redirect_to manage_opendata_dataset_path(@dataset)
    else
      render :edit
    end
  end

end
