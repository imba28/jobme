class MatchingController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # tinder match logik :-)
  # TODO
  def match
    JobsAlgo()
    @matches = []
    @allJobs = Job.all
    for v in @arrJob do
      begin
        output = ''
        job = @allJobs.find(v[:id])
      rescue ActiveRecord::RecordNotFound => e
        output = nil
      end
      if output
        @matches.push(job)
      end
    end
  end

  def getValue
    begin
      @value = params.require(:inCategory)
    rescue ActionController::ParameterMissing => e
      @value = Random.rand(15).to_s + ',1,10'
      puts @value
    end
  end

  def JobsAlgo
    @arrJob = []
    getValue()
    @value = @value.split(',')
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
