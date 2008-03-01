# Author: Stefan Saasen <s@juretta.com>

require 'rubygems'
require 'rake'
require 'rake/clean'   
require 'rcov/rcovtask'
require 'hoe'
require 'fileutils'

include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'wddx', 'version')

# clean files and directories
CLEAN.include ['**/.*.sw?', '*.gem', '.config', 'coverage']

Hoe.new("wddx", Wddx::VERSION::STRING) do |hoe|
  hoe.rubyforge_name = "wddx"
  hoe.developer("Stefan Saasen", "s@juretta.com")
  hoe.test_globs = ["test/**/tc_*.rb"]
  hoe.clean_globs = CLEAN
  hoe.need_tar = false
  hoe.remote_rdoc_dir = '' # Release to root
  hoe.spec_extras = {:dependencies => []}   # - A hash of extra values to set in the gemspec.
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