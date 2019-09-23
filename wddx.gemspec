Gem::Specification.new do |s|
  s.name = 'wddx'
  s.version = '0.4.1'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['Stefan Saasen']
  s.date = '2008-04-30'
  s.description = "Ruby API for the WDDX XML interchange format (see http://www.openwddx.org/)   From http://www.openwddx.org/faq/: WDDX is an XML-based technology that enables the exchange of complex data between Web programming languages,  creating what some refer to as 'Web syndicate networks'.  WDDX consists of a language-independent representation of data based on an XML 1.0 DTD, and a set of  modules for a wide variety of languages that use WDDX.  WDDX can be used with HTTP, SMTP, POP, FTP and other Internet protocols that support transferring textual data.  WDDX Home: http://www.openwddx.org/  The Ruby WDDX Gem enables easy usage of WDDX in Ruby."
  s.email = ['s@juretta.com']
  s.executables = ['wddx']
  s.extra_rdoc_files = ['History.txt', 'README.txt', 'test/fixtures/ascii_characters.txt']
  s.files = ['bin/wddx', 'History.txt', 'README.txt', 'test/fixtures/ascii_characters.txt']
  s.homepage = 'http://wddx.rubyforge.org/'
  s.rdoc_options = ['--main', 'README.txt']
  s.require_paths = ['lib']
  s.rubyforge_project = 'wddx'
  s.rubygems_version = '2.0.14'
  s.summary = "Ruby API for the WDDX XML interchange format (see http://www.openwddx.org/)   From http://www.openwddx.org/faq/: WDDX is an XML-based technology that enables the exchange of complex data between Web programming languages,  creating what some refer to as 'Web syndicate networks'"
end
