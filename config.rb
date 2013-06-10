require 'data/student'

Student.all.each do |student|
  puts "Creating url for student: /students/#{student.slug}.html"
  proxy "/students/#{student.slug}.html", "/student.html", :locals => { :student => student }
  proxy "/students/#{student.slug}", "/student.html", :locals => { :student => student }
end

helpers do
  def student_path(student)
    "/students/#{student.slug}"
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end