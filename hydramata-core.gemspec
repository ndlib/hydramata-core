$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'hydramata/core/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'hydramata-core'
  s.version     = Hydramata::Core::VERSION
  s.authors     = [
    'Jeremy Friesen'
  ]
  s.email       = [
    'jeremy.n.friesen@gmail.com'
  ]
  s.homepage    = 'https://github.com/ndlib/hydramata-core'
  s.summary     = ''
  s.description = ''
  s.required_ruby_version = '~> 2.0'

  s.license = 'APACHE2'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) do |f|
    f == 'bin/rails' ? nil : File.basename(f)
  end.compact
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-given', '~> 3.5'
  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rubydora', '~> 1.7'
  s.add_development_dependency 'database_cleaner', '~> 1.3'
end
