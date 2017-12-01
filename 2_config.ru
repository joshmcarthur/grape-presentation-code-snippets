require "bundler/setup"
Bundler.require
ActiveModelSerializers.config.adapter = :json_api
require_relative "1_employee_index"
run EmployeeApp::API
