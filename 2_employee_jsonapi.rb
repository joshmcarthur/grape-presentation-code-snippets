require_relative "./employee"

class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :email, :full_name
end

# app/api/employee_app/api.rb
module EmployeeApp
  class API < ::Grape::API
    default_format :json
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
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
