# Author: Stefan Saasen <s@juretta.com>
#
# export RSYNC_PASSWORD=$MY_PASSWORD

require 'rubygems'
require 'rake'
require 'rake/clean'   
require 'rcov/rcovtask'
require 'hoe'
require 'fileutils'
require 'tempfile'

include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'wddx', 'version')

# clean files and directories
CLEAN.include ['**/.*.sw?', '*.gem', '.config', 'coverage']
PROJECT_NAME = "wddx"
#RUBYFORGE_CONFIG = YAML.load(open("#{ENV['HOME']}/.rubyforge/user-config.yml"))

Hoe.new(PROJECT_NAME, Wddx::VERSION::STRING) do |hoe|
  hoe.rubyforge_name = PROJECT_NAME
  hoe.developer("Stefan Saasen", "s@juretta.com")
  hoe.test_globs = ["test/**/tc_*.rb"]
  hoe.clean_globs = CLEAN
  hoe.need_tar = false
  hoe.rsync_args << " -z"
  hoe.remote_rdoc_dir = '' # Release to root
  hoe.spec_extras = {:dependencies => []}   # - A hash of extra values to set in the gemspec.
end

desc 'Upload additional files to rubyforge'
task :website_upload do
  RUBYFORGE_CONFIG = YAML.load(open("#{ENV['HOME']}/.rubyforge/user-config.yml"))
  username = RUBYFORGE_CONFIG['username']
  host = "#{username}@rubyforge.org"
  remote_dir = "/var/www/gforge-projects/#{PROJECT_NAME}/"
  sh %{rsync -tv wddx.xml #{host}:#{remote_dir}}
end

desc "Publish RDoc to RubyForge"
task :publish_docs => [:clean, :docs] do
  Rake::Task['website_upload'].invoke
end
                                                 
Rcov::RcovTask.new("rcov") do |t|
  t.test_files = FileList['test/*_test.rb']
  t.verbose = false
  t.rcov_opts << "--test-unit-only"
  t.ruby_opts << "-Ilib:ext/rcovrt" # in order to use this rcov
  t.output_dir = "coverage"
end          

desc "Run basic unit tests"
Rake::TestTask.new("test_units") { |t|
  t.pattern = 'test/tc_*.rb'
  t.verbose = false
  t.warning = true
}          
