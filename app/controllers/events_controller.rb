class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    # @event = current_user.created_events.build
    @event = Event.new
  end

  def create
    # @event = current_user.created_events.build(event_params)
    # debugger
    @event = Event.new(event_params)
    # puts "Event Params: #{event_params.inspect}"
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    
    else
      render :new
    end
  end


  # def create
  #   @event = Event.new(event_params)
  
  #   if @event.save
  #     # On successful save, use Turbo Streams to update the page
  #     render turbo_stream: turbo_stream.append(
  #       'events_list',   # Replace with the actual ID or selector of the target container
  #       partial: 'event',  # Replace with the name of the partial to render each event
  #       locals: { event: @event }
  #     )
  #   else
  #     # If save fails, re-render the form within the Turbo Frame
  #     render turbo_stream: turbo_stream.replace(
  #       'new_event_form',   # Replace with the actual ID or selector of the Turbo Frame
  #       partial: 'form',    # Replace with the name of the partial containing the form
  #       locals: { event: @event }
  #     )
  #   end
  # end
  

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
  

end
