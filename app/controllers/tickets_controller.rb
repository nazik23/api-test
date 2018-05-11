class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index
	  @ticket = Ticket.last
		@excavator = Excavator.last
  end
 
	def create
    @ticket = Ticket.new(
			request_number: params["RequestNumber"],
			sequence_number: Integer(params["SequenceNumber"]),
			request_type: params["RequestType"],
			response_due_date_time: DateTime.parse(params["DateTimes"]["ResponseDueDateTime"]),
			primary_service_area_code: params["ServiceArea"]["PrimaryServiceAreaCode"]["SACode"],
			additional_service_area_codes: params["ServiceArea"]["AdditionalServiceAreaCodes"]["SACode"],
			well_known_text: params["ExcavationInfo"]["DigsiteInfo"]["WellKnownText"],
			)
		@ticket.save

		@excavator = Excavator.new(
		  ticket_id: @ticket.id,
			company_name: params["Excavator"]["CompanyName"],
			crew_on_site: ActiveRecord::Type::Boolean.new.cast(params["Excavator"]["CrewOnSite"]),
			address: {address: params["Excavator"]["Address"],
			          city: params["Excavator"]["City"],
								state: params["Excavator"]["State"],
								zip: params["Excavator"]["Zip"]})
		@excavator.save
#render json: {status: 'SUCCESS', message: 'ok', data: @ticket}, status: :ok

# respond_to do |format|
#			   format.html
#			   format.json { redirect_to tickets_index_url}
#			 end
#		else
#		   render json: {status: 'ERROR', message: 'ok', data: @ticket.errors}, status: :ok
#		end
  end
end
