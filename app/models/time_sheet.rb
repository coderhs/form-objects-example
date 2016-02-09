class TimeSheet < ActiveRecord::Base

  # All the duration needs to stored as seconds

  def required_duration_in_hours
    required_duration.to_f/(60*60)
  end

  def minimum_duration_in_hours
     minimum_duration.to_f/(60*60)
  end

  def actual_duration_in_hours
     actual_duration.to_f/(60*60)
  end
end
