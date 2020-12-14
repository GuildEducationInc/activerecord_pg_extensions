
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_pg_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord_pg_extensions'
  spec.version       = ActiveRecordPgExtensions::VERSION
  spec.authors       = ['Stafford Brunk', 'Josh Mattila']
  spec.email         = ['stafford@guildeducation.com', 'josh.mattila@guildeducation.com']

  spec.summary       = 'Collection of PostgreSQL specific extensions to ActiveRecord'
  spec.description   = 'Extensions to ActiveRecord\'s PostgreSQL adapter to enable additional functionality'
  spec.homepage      = 'https://github.com/GuildEducationInc/activerecord_pg_extensions'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 5.0.7'
  spec.add_dependency 'pg', '>= 1.1.4'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rspec-rails', '~> 3.9'
  spec.add_development_dependency 'rubocop', '>= 0.78.0'
end
