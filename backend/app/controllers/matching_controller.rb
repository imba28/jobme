class MatchingController < ApplicationController

  def match
    arrJob = JobsAlgo()
    @matches = []
    @allJobs = Job.all
    if !arrJob
      arrJob = Job.find(6)
    end
    for v in arrJob do
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
      return params.require(:inCategory)
    rescue ActionController::ParameterMissing => e
      return '29,29'
    end
  end

  def JobsAlgo
    @arrJob = []
    value = getValue().split(',')
    for v in value do
      matchingJobs(v)
    end
    return weightJobs(@arrJob.sort())
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
  
  def weightJobs(arrJob)
    result = []
    str = arrJob[0]
    num = 0
    for v in arrJob do
      if v.eql?(str)
        num += 1
      else
        x = {
          id:  str,
          weight: num
        }
        if x[:weight].to_i >= 1
          result.push(x)
        end
        str = v
        num = 1
      end
    end
    x = {
      id:  str,
      weight: num
    }
    if x[:weight].to_i >= 1
      result.push(x)
    end
    return result.sort {|a,b| b[:weight] <=> a[:weight]}
  end
end
