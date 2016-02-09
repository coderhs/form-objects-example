class TimeSheet < ActiveRecord::Base

  # All the duration needs to stored as seconds

  validate :validate_required_duration_in_hours
  validate :validate_minimum_duration_in_hours
  validate :validate_actual_duration_in_hours

  def required_duration_in_hours
    required_duration.to_f/(60*60)
  end

  def minimum_duration_in_hours
     minimum_duration.to_f/(60*60)
  end

  def actual_duration_in_hours
     actual_duration.to_f/(60*60)
  end

  private

  def validate_required_duration_in_hours
    if !required_duration
      errors.add(:required_duration_in_hours, 'Can\'t be left blank')
    elsif required_duration_in_hours > (24*60*60)
      errors.add(:required_duration_in_hours, 'Can\'t be more than 24 hours')
    end
  end

  def validate_minimum_duration_in_hours
    if !minimum_duration
      errors.add(:minimum_duration_in_hours, 'Can\'t be left blank')
    elsif minimum_duration_in_hours > (24*60*60)
      errors.add(:minimum_duration_in_hours, 'Can\'t be more than 24 hours')
    end
  end

  def validate_actual_duration_in_hours
    if !actual_duration
      errors.add(:actual_duration_in_hours, 'Can\'t be left blank')
    elsif actual_duration_in_hours > (24*60*60)
      errors.add(:actual_duration_in_hours, 'Can\'t be more than 24 hours')
    end
  end
end
