class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jobs
  # GET /jobs.json
  def index
    JobsAlgo()
    @jobs = []
    @allJobs = Job.all
    for v in @arrJob do
      begin
        output = ''
        job = @allJobs.find(v[:id])
      rescue ActiveRecord::RecordNotFound => e
        output = nil
      end
      if output
        @jobs.push(job)
      end
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @sub = Subcategory.all
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @sub = Subcategory.all
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    if params[:sub] then
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
    if params[:sub] then
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
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :image, :image_preview, :description)
    end

    def getValue
      params = ActionController::Parameters.new({
        sub: {
          number:[1, 3, 4]
        }
      })
      @value = params.require(:sub).permit(number: [])      
    end

    def JobsAlgo
      @arrJob = []
      getValue()
      @value = @value.fetch(:number)
      for v in @value do
        matchingJobs(v)
      end
      @arrJob = @arrJob.sort()
      weightJobs()
    end

    def matchingJobs(idx)
      jobs = Job.all
      subcate = Subcategory.find(idx)
      for job in jobs do
        begin
          output = ''
          id = job.subcategories.find(subcate.id).id
        rescue ActiveRecord::RecordNotFound => e
          output = nil
        end
        if output
          @arrJob.push(job.id)
        end
      end
    end
    
    def weightJobs
      @result = []
      str = @arrJob[0]
      num = 0
      for v in @arrJob do
        if v.eql?(str)
          num += 1
        else
          x = {
            id:  str,
            weight: num
          }
          @result.push(x)
          str = v
          num = 1
        end
      end
      x = {
        id:  str,
        weight: num
      }
      @result.push(x)
      @arrJob = @result.sort {|a,b| b[:weight] <=> a[:weight]}
    end
end
