class CompaniesController < ApplicationController
    def show
        @employee = Employee.new
        @company = Company.find(params[:id])
    end

    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
    end

    def create
        byebug
        @company = Company.create(company_params(:name, :offices))
        if @company.valid?
            redirect_to company_path(@company)
        else
            render 'new'
        end
    end

    private

    def company_params(*args)
        params.require(:company).permit(*args)
    end
end