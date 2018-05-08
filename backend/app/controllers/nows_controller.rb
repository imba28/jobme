class NowsController < ApplicationController
  before_action :set_now, only: %i[show edit update destroy]

  # GET /nows
  # GET /nows.json
  def index
    @nows = Category.all.where(chilhood: '0')
  end

  # GET /nows/1
  # GET /nows/1.json
  def show; end

  # GET /nows/new
  def new
    @now = Now.new
  end

  # GET /nows/1/edit
  def edit; end

  # POST /nows
  # POST /nows.json
  def create
    @now = Now.new(now_params)

    respond_to do |format|
      if @now.save
        format.html { redirect_to @now, notice: 'Now was successfully created.' }
        format.json { render :show, status: :created, location: @now }
      else
        format.html { render :new }
        format.json { render json: @now.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nows/1
  # PATCH/PUT /nows/1.json
  def update
    respond_to do |format|
      if @now.update(now_params)
        format.html { redirect_to @now, notice: 'Now was successfully updated.' }
        format.json { render :show, status: :ok, location: @now }
      else
        format.html { render :edit }
        format.json { render json: @now.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nows/1
  # DELETE /nows/1.json
  def destroy
    @now.destroy
    respond_to do |format|
      format.html { redirect_to nows_url, notice: 'Now was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_now
    @now = Now.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def now_params
    params.fetch(:now, {})
  end
end
