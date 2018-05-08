class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :is_admin?, only: %i[new edit create update destroy]
  before_action :check_format, only: %i[index show]

  # GET /jobs
  # GET /jobs.json
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @jobs = @user.jobs
    else
      @jobs = Job.all
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show; end

  # GET /jobs/new
  def new
    @sub = Subcategory.all
    @job = Job.new

    @user = User.find(params[:user_id]) if params[:user_id]
  end

  # GET /jobs/1/edit
  def edit
    @sub = Subcategory.all
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if params[:user_id]
      if params[:job_id]
        @job = Job.find(params[:job_id]) # add existing job to user job collection
      end

      @user = User.find(params[:user_id])
      @user.jobs << @job unless @user.jobs.include? @job
    else
      @job = Job.new(job_params)
    end

    if params[:sub]
      params[:sub].each do |id|
        @job.subcategories << Subcategory.find(id)
      end
    end

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if params[:sub]
      @job.subcategories.clear
      params[:sub].each do |id|
        @job.subcategories << Subcategory.find(id)
      end
    end

    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if params[:user_id]
      @user.jobs.delete(@job)
    else
      @job.destroy
    end

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:name, :image, :image_preview, :description)
  end
end
