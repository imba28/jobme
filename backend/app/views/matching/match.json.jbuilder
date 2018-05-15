# frozen_string_literal: true

json.array! @matches, partial: 'jobs/job', as: :job
