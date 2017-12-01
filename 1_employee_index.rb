require_relative "./employee"

# app/api/employee_app/api.rb
module EmployeeApp
  class API < ::Grape::API
    default_format :json
    format :json
    # ...
    get :employees do
      @employees = Employee.all
    end

    get "employees/:id" do
      Employee.find(params[:id])
    end
    
    post :employees do
      Employee.create(params[:employee])
    end

    delete "employees/:id" do
      @employee = Employee.find(params[:id])
      @employee.destroy
      body false
    end
  end
end
