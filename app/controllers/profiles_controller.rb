require 'date'
class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :middleware_login

  def middleware_login
    if !login_in?
      redirect_to "/login"
    end
  end
  # GET /profiles or /profiles.json
  def index
    per_page = params[:per_page] ? params[:per_page] : 5
    @profiles = Profile.filter_profile profile_params_filter, params[:page], per_page
    @codeCompanyProfiles = Company.getCompanyByIds(Profile.codeCompanyProfiles)
    @per_page = per_page
    @params = params[:per_page] ? params : profile_params_filter
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @profile = Profile.find_by(profile_id: params[:id])
    @codeCompanyProfiles = Company.getCompanyByIds(Profile.codeCompanyProfiles)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @companiesSelect = Company.all.pluck(:company_name, :code)
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:status] = "success"
      redirect_to @profile
    else
      render 'show'
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:profile_id, :code, :company_name, :email, :phone_number, :status, :release_date)
    end

    def profile_params_filter
      params.permit(:code, :company_name, :email, :phone_number, :status, :release_date)
    end
end
