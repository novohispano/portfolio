require_relative 'has_attributes'
require_relative 'location'

class Student
  include HasAttributes

  def self.root_path
    File.expand_path(File.dirname(__FILE__))
  end

  def self.student_files
    Dir[File.join(root_path,"students","*.rb")]
  end

  def self.student_data(student_file)
    eval(File.read(student_file))
  rescue Exception => exception
    puts "FAILED to parse #{student_file}: #{exception}"

  end

  def self.all
    student_files.map do |student_file|
      Student.new student_data(student_file)
    end
  end

  attributes :first_name, :last_name, :email_address, :image_url,
    :looking_for, :best_at, :looking_for_description, :locations,
    :resume, :references

  def name
    [ first_name, last_name ].join(" ")
  end

  attribute :locations, [ :locations ], Location

  class Project
    include HasAttributes
    attributes :title, :description, :url, :what_to_look_for
  end

  attribute :project_1, [ :code, :project_1 ], Project
  attribute :project_2, [ :code, :project_2 ], Project
  attribute :project_3, [ :code, :project_3 ], Project

  def projects
    [ project_1, project_2, project_3 ].select { |p| p.content }
  end

  def slug
    [ first_name, last_name ].join("_").downcase
  end

  attribute :github_url, [ :code, :github ]

end