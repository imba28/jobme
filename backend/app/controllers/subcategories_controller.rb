class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  before_action :check_format, only: [:index, :show]


  # GET /subcategories
  # GET /subcategories.json
  def index
    if params[:category_id] 
      @subcategories = Category.find(params[:category_id]).subcategories
    else
      @subcategories = Subcategory.all
    end
  end

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
  end

  # GET /subcategories/new
  def new
    @categories = Category.all
    @subcategory = Subcategory.new
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)
    # @subcategory.category = Category.find(params.require(:subcategory)[:cat])

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully created.' }
        format.json { render :show, status: :created, location: @subcategory }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1
  # PATCH/PUT /subcategories/1.json
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @categories = Category.all
      @subcategory = Subcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcategory_params
      params.require(:subcategory).permit(:name, :icon, :category_id)
    end
end
