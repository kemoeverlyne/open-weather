class CityController < ApplicationController
  def create
    success_msg = []
    error_msg = []
    begin
      if params[:country].present?
        state = CS.states(params[:country])
        success_msg = state
      end

      if params[:selected_country].present? && params[:state].present?
        cities = CS.get params[:selected_country], params[:state]
        success_msg = cities
      end

    rescue Exception => e
      error_msg.push(:error_msh => "Record not created.")
      puts e.to_s
    end


    if error_msg.length > 0
      # then render head not found
      render :status => :not_found, :json => error_msg
    else
      # otherwise send ok status
      render json: success_msg
    end
  end

end
