class Manage::OpendataCategoriesController < Manage::ApplicationController

  def index
    @opendata_categories = OpendataCategory.ordered
  end

  def new
    @opendata_category = OpendataCategory.new
  end

  def create
    @opendata_category = OpendataCategory.new(params[:opendata_category])
    if @opendata_category.save
      redirect_to manage_opendata_categories_path
    else
      render :new
    end
  end

  def edit
    @opendata_category = OpendataCategory.find(params[:id])
  end

  def update
    @opendata_category = OpendataCategory.find(params[:id])
    if @opendata_category.update_attributes(params[:opendata_category])
      redirect_to manage_opendata_categories_path
    else
      render :edit
    end
  end

  def destroy
    OpendataCategory.find(params[:id]).destroy
    redirect_to manage_opendata_categories_path
  end

end
