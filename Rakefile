# Author: Stefan Saasen <s@juretta.com>

require 'rubygems'
require 'rake'
require 'rake/clean'   
require 'rcov/rcovtask'
require 'hoe'
require 'fileutils'

include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'wddx', 'version')

RELEASE_TYPES = %w( gem ) # can use: gem, tar, zip
REV = nil # UNCOMMENT IF REQUIRED: File.read(".svn/entries")[/committed-rev="(d+)"/, 1] rescue nil
VERS = ENV['VERSION'] || (Wddx::VERSION::STRING + (REV ? ".#{REV}" : ""))
CLEAN.include ['**/.*.sw?', '*.gem', '.config', 'coverage']
RDOC_OPTS = [
    '--quiet', 
    '--title', "Ruby::WDDX documentation",
    "--opname", "index.html",
    "--line-numbers",
    "--include", "lib/**/*.rb",
    "--include", "examples/**/*.rb",
    "--main", "README.txt",
    "--inline-source"
]
GEM_NAME = "wddx"
DESCRIPTION = "Ruby API for the WDDX XML interchange format (see http://www.openwddx.org/)"

# Run 'rake -T' to see list of generated tasks (from gem root directory)
hoe = Hoe.new(GEM_NAME, VERS) do |p|
  p.name = GEM_NAME
  p.author = "Stefan Saasen" 
  p.description = DESCRIPTION
  p.email = "s@juretta.com"
  p.summary = DESCRIPTION
  p.url = "http://#{GEM_NAME}.rubyforge.org" 
  p.lib_files = Dir["lib/**/*.rb"]
  p.rubyforge_name = GEM_NAME
  p.test_globs = ["test/**/tc_*.rb"]
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.clean_globs = CLEAN  # An array of file patterns to delete on clean.
  p.remote_rdoc_dir = '' # Release to root
  p.spec_extras = {:dependencies => []}   # - A hash of extra values to set in the gemspec.
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