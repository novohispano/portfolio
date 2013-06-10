require 'bundler'
Bundler.require
require 'puma'
require 'middleman/rack'
require "rack/rewrite"

use Rack::Rewrite do
  rewrite %r{^/courses/(\w+)}, lambda {|match, rack_env|
    if match[1].empty?
      return "/courses"
    else
      return "/courses/#{match[1]}.html"
    end
  }
  rewrite %r{/(.+)}, lambda {|match, rack_env|
    if match[1].end_with?('/')
      fragment = match[1][0..-2]
    else
      fragment = match[1]
    end

    file_path = "source/#{fragment}.html"
    erb_file = "#{file_path}.erb"

    if File.exists? erb_file
      return "/#{fragment}.html"
    else
      return "/#{fragment}"
    end
  }
end

run Middleman.server
