Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'onis'
  s.version = '0.2.1'
  s.date = '2009-10-27'

  s.description = "Live ObjectSpace introspection (With Rack endpoint)"
  s.summary     = s.description

  s.authors = ["Blake Mizerany"]
  s.email = "blake.mizerany@gmail.com"

  s.files = %w[
    README.md
    onis.gemspec
    lib/onis.rb
    lib/onis/base.rb
    lib/onis/web.rb
    bin/onis
  ]
  s.executables = ['onis']

  s.extra_rdoc_files = %w[README.md]

  s.homepage = "http://github.com/bmizerany/onis/"
  s.require_paths = %w[lib]
  s.rubygems_version = '1.1.1'
end
