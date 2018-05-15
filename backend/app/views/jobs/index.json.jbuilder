# frozen_string_literal: true

json.array! @jobs, partial: 'jobs/job', as: :job
