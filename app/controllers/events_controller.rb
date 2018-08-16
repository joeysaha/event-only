class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.name = params[:event][:name]
    @event.date = params[:event][:date]
    @event.capacity = params[:event][:capacity]
    @event.city = params[:event][:city]
    @event.image = params[:event][:image]
    @event.description = params[:event][:description]

    if @event.save
      redirect_to event_url(@event)
    else
      flash[:alert] = "Coudln't update event"
      redirect_to event_url(@event)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.name = params[:event][:name]
    @event.date = params[:event][:date]
    @event.capacity = params[:event][:capacity]
    @event.city = params[:event][:city]
    @event.image = params[:event][:image]
    @event.description = params[:event][:description]


    if @event.save
      redirect_to events_url
    else
      flash[:alert] = "Coudln't create event"
      redirect_to new_event_url
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

end
