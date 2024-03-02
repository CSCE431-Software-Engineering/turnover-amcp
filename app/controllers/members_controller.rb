class MembersController < ApplicationController
  before_action :authenticate_member! # Ensure the member is logged in
  before_action :check_admin
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  def profile
    @member = current_member # Assuming Devise and current_admin helper is available
    render :show # Optionally, you can render the same view as 'show' if it fits
  end
  # POST /members or /members.json
  def create
    # Check if the team_id is set to 0 and if so, set it to nil
    if member_params[:team_id].to_i.zero?
      params[:member][:team_id] = nil
    end
  
    @member = Member.new(member_params)
  
    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    # Check if the team_id is set to 0 and if so, set it to nil
    if member_params[:team_id].to_i.zero?
      params[:member][:team_id] = nil
    end
  
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check_admin
    unless current_member&.is_admin?
      redirect_to root_path, alert: 'You are not authorized to view this page.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:team_id, :first_name, :last_name, :points, :is_admin, :email, :paid_nat_dues, :paid_loc_dues)
    end
end
