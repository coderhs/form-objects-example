class TimeSheetsController < ApplicationController
  def index
    @time_sheet = NewTimeSheetForm.new
  end

  def create
    @time_sheet = NewTimeSheetForm.new(new_time_sheet_params)
    if @time_sheet.record
      redirect_to time_sheets_path, notice: 'Saved'
    else
      render 'index'
    end
  end

  private

  def new_time_sheet_params
    params.require(:time_sheet).permit(:actual_duration_in_hours,
                                        :required_duration_in_hours,
                                        :minimum_duration_in_hours)
  end
end
