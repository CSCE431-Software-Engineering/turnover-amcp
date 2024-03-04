# frozen_string_literal: true

# ActivitiesController manages all actions related to Activity resources.
# This includes creating, updating, deleting, and displaying activities.
# It inherits from ApplicationController to leverage common functionality
# across the application.
class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  before_action :authenticate_member! # Assumes you have some authentication method

  def participants
    @activity = Activity.find(params[:id])
    @participants = @activity.members
  end

  def remove_participant
    activity = Activity.find(params[:id])
    participant = activity.members.find(params[:participant_id])
    if participant
      new_points_total = participant.points - activity.points
      participant.update(points: new_points_total)
  
      activity.members.delete(participant)
      flash[:notice] = "Participant was successfully removed."
    else
      flash[:alert] = "Participant could not be found."
    end
    redirect_to participants_activity_path(activity)
  end
  

  def sign_up
    @activity = Activity.find(params[:id])
    participation = Participation.new(member: current_member, activity: @activity)
  
    if participation.save
      current_member.points += @activity.points
      if current_member.save
        flash[:notice] = 'You have successfully signed up for the activity and earned points.'
      else
        flash[:alert] = current_member.errors.full_messages.to_sentence
      end
    else
      flash[:alert] = participation.errors.full_messages.to_sentence
    end
    redirect_to @activity
  end

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show; end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit; end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:event_name, :start_time, :end_time, :location, :description, :activity_type, :points)
  end

end
