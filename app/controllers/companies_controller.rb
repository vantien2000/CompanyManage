class CompaniesController < ApplicationController
  before_action :middleware_login

  def middleware_login
    if !login_in?
      redirect_to "/login"
    end
  end
  # GET /companies or /companies.json
  def index
    per_page = params[:per_page] ? params[:per_page] : 5
    @companies = filter_company company_params_filter, per_page
    @per_page = per_page
    @params = params[:per_page] ? params : company_params_filter
  end

  # GET /companies/1 or /companies/1.json
  def show
    @company = Company.find_by(code: params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
    # respond_to do |format|
    #   if @company.save
    #     format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
    #     format.json { render :show, status: :created, location: @company }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @company.errors, status: :unprocessable_entity }
    #   end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:status] = "success"
      redirect_to @company
    else
      render 'show'
    end
  end

  def updateStatus
    status = params[:status].to_i
    @company = Company.find(params[:code])
    if @company.update_attribute(:status, status)
      flash[:status] = "success"
      redirect_to @company
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:code, :company_name, :address, :email, :phone_number, :website, :logo)
    end

    def company_params_filter
      params.permit(:code, :company_name, :email, :phone_number, :status)
    end
    def filter_company company_params_filter, per_page
      @companies = Company.all
      if !company_params_filter.empty?
        if !(company_params_filter[:code]).empty?
          @companies = @companies.where("code LIKE ?", "%" + company_params_filter[:code] + "%")
        end
        if !(company_params_filter[:company_name]).empty?
          @companies = @companies.where("company_name LIKE ?", "%" + company_params_filter[:company_name] + "%")
        end
        if !(company_params_filter[:email]).empty?
          @companies = @companies.where("email LIKE ?", "%" + company_params_filter[:email] + "%")
        end
        if !(company_params_filter[:phone_number]).empty?
          @companies = @companies.where("phone_number LIKE ?", "%" + company_params_filter[:phone_number] + "%")
        end
        if !(company_params_filter[:status]).empty?
          @companies = @companies.where(status: company_params_filter[:status])
        end
      end
      @companies = @companies.paginate(page: params[:page], per_page: per_page).order('companies.code DESC')
    end
end
