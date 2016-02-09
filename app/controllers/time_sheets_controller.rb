class TimeSheetsController < ApplicationController
  def index
    @time_sheet = TimeSheet.new
  end

  def create
    @time_sheet = TimeSheet.new(time_sheet_params)
    if @time_sheet.save
      redirect_to time_sheets_path, notice: 'Saved'
    else
      render 'index'
    end
  end

  private

  def time_sheet_params
    params.require(:time_sheet).permit.merge!({:actual_duration => params.require(:time_sheet).fetch(:actual_duration_in_hours).to_f*60*60,
                                        :required_duration => params.require(:time_sheet).fetch(:required_duration_in_hours).to_f*60*60,
                                        :minimum_duration => params.require(:time_sheet).fetch(:minimum_duration_in_hours).to_f*60*60})
  end
end
