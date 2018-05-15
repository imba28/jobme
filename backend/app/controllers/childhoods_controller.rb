# frozen_string_literal: true

class ChildhoodsController < ApplicationController
  before_action :set_childhood, only: %i[show edit update destroy]

  # GET /childhoods
  # GET /childhoods.json
  def index
    @childhoods = Category.all.where(chilhood: '1')
  end

  # GET /childhoods/1
  # GET /childhoods/1.json
  def show; end

  # GET /childhoods/new
  def new
    @childhood = Childhood.new
  end

  # GET /childhoods/1/edit
  def edit; end

  # POST /childhoods
  # POST /childhoods.json
  def create
    @childhood = Childhood.new(childhood_params)

    respond_to do |format|
      if @childhood.save
        format.html { redirect_to @childhood, notice: 'Childhood was successfully created.' }
        format.json { render :show, status: :created, location: @childhood }
      else
        format.html { render :new }
        format.json { render json: @childhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /childhoods/1
  # PATCH/PUT /childhoods/1.json
  def update
    respond_to do |format|
      if @childhood.update(childhood_params)
        format.html { redirect_to @childhood, notice: 'Childhood was successfully updated.' }
        format.json { render :show, status: :ok, location: @childhood }
      else
        format.html { render :edit }
        format.json { render json: @childhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /childhoods/1
  # DELETE /childhoods/1.json
  def destroy
    @childhood.destroy
    respond_to do |format|
      format.html { redirect_to childhoods_url, notice: 'Childhood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_childhood
    @childhood = Childhood.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def childhood_params
    params.fetch(:childhood, {})
  end
end
