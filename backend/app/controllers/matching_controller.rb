# frozen_string_literal: true

class MatchingController < ApplicationController
  def match
    arr_job = jobs_algo
    @matches = []
    @all_jobs = Job.all
    arr_job.push(Job.find(6)) if arr_job.empty?
    arr_job.each do |v|
      begin
        output = ''
        job = @all_jobs.find(v[:id])
      rescue ActiveRecord::RecordNotFound
        output = nil
      end
      @matches.push(job) if output
    end
  end

  def values
    params.require(:inCategory)
  rescue ActionController::ParameterMissing
    '29'
  end

  def jobs_algo
    @arr_job = []
    value = values.split(',')
    value.each do |v|
      matching_jobs(v)
    end
    weight_jobs(@arr_job.sort)
  end

  def matching_jobs(idx)
    jobs = Job.all
    subcate = Subcategory.find(idx)
    jobs.each do |job|
      begin
        output = ''
        job.subcategories.find(subcate.id).id
      rescue ActiveRecord::RecordNotFound
        output = nil
      end
      @arr_job.push(job.id) if output
    end
  end

  def weight_jobs(arr_job)
    result = []
    str = arr_job[0]
    num = 0
    arr_job.each do |v|
      if v.eql?(str)
        num += 1
      else
        x = {
          id:  str,
          weight: num
        }
        result.push(x) if x[:weight].to_i >= 2
        str = v
        num = 1
      end
    end
    x = {
      id:  str,
      weight: num
    }
    result.push(x) if x[:weight].to_i >= 2
    result.sort { |a, b| b[:weight] <=> a[:weight] }
  end
end
