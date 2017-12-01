class Employee 
  include ActiveModel::Serialization
  attr_accessor :id, :full_name, :email, :job_title

  def initialize(attrs = {})
    attrs.each do |key, val|
      public_send(:"#{key}=", val) if respond_to?(:"#{key}=")
    end
  end

  def self.all
    @@DATA.map { |data| Employee.new(data) }
  end

  def self.find(id)
    all.find { |emp| emp.id == id.to_i } || raise("404 Not found")
  end

  def self.create(attrs)
    Employee.new(attrs.merge(id: rand(150...500))).tap { |emp| @@DATA << emp }
  end

  def destroy
    @@DATA.delete(self)
  end

  def to_h
    { id: id, full_name: full_name, email: email, job_title: job_title }
  end

  def to_json(*options)
    to_h.to_json
  end
end

Employee.class_variable_set(:@@DATA, 1.upto(100).map do |i|
  {id: i, full_name: Faker::Name.name, email: Faker::Internet.email, job_title: Faker::Job.title}
end)
