
class CompanyRepository
    def filter_company company_params_filter, page
      @companies = Company.all
      if !company_params_filter.empty?
        if !(company_params_filter[:code]).empty?
          @companies = @companies.where(code: company_params_filter[:code])
        end
        if !(company_params_filter[:company_name]).empty?
          @companies = @companies.where(company_name: company_params_filter[:company_name])
        end
        if !(company_params_filter[:email]).empty?
          @companies = @companies.where(email: company_params_filter[:email])
        end
        if !(company_params_filter[:phone_number]).empty?
          @companies = @companies.where(phone_number: company_params_filter[:phone_number])
        end
        if !(company_params_filter[:status]).empty?
          @companies = @companies.where(status: company_params_filter[:status])
        end
      end
      @compamy = @companies.paginate(page: page, per_page: 5)
    end
end