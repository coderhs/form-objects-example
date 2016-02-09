class NewTimeSheetForm
  include ActiveModel::Model

  MAXVALUE = 24

  attr_accessor(
    :required_duration_in_hours,
    :actual_duration_in_hours,
    :minimum_duration_in_hours,
  )

  validates :required_duration_in_hours, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => MAXVALUE }
  validates :actual_duration_in_hours, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => MAXVALUE }
  validates :minimum_duration_in_hours, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => MAXVALUE }

  def record
    if valid?
      # We can write our model call backs here
      time_sheet = TimeSheet.create(required_duration: required_duration_in_hours.to_f*60*60,
                        actual_duration: actual_duration_in_hours.to_f*60*60,
                        minimum_duration: minimum_duration_in_hours.to_f*60*60)
      time_sheet
    end
  end

  def self.model_name
    TimeSheet.model_name
  end
end