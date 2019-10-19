class EmployeesController < ApplicationController
    def destroy
        employee = Employee.find(params[:id])
        company = employee.company
        employee.destroy
        redirect_to company_path(company)
    end

    def create
        
       @employee = Employee.create(employee_params(:name, :title, :company_id))
        if @employee.valid?
            redirect_to company_path(Company.find(params[:employee][:company_id]))
        else
            redirect_to "/companies/#{params[:employee][:company_id]}"
        end
    end

    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end
end
