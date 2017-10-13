
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_pg_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord_pg_extensions'
  spec.version       = ActiveRecordPgExtensions::VERSION
  spec.authors       = ['Stafford Brunk']
  spec.email         = ['stafford@guildeducation.com']

  spec.summary       = 'Collection of PostgreSQL specific extensions to ActiveRecord'
  spec.description   = 'Extensions to ActiveRecord\'s PostgreSQL adapter to enable additional functionality'
  spec.homepage      = 'https://github.com/GuildEducationInc/activerecord_pg_extensions'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 4.2.0'
  spec.add_dependency 'pg'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_development_dependency 'rubocop', '>= 0.50.0'
end
