require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rubygems'
require 'bundler'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the linktv_platform plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the linktv_platform plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Linktv::Platform'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "linktv_platform"
  gem.homepage = "http://github.com/definitionstudio/linktv_platform"
  gem.license = "MIT"
  gem.summary = %Q{Link TV Platform is a Rails Engine for Ruby on Rails 2.3. The platform provides a framework for creating rich video sites, integrating Semantic Web technologies and content discovery services.}
  #gem.description = %Q{}
  #gem.email = ""
  gem.authors = ["Definition LLC (Rob DiCiuccio, Doug Puchalski, Evan Rusackas) for Link Media, Inc."]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
