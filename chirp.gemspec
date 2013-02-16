$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chirp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chirp-rb"
  s.version     = Chirp::VERSION
  s.authors     = ["Dan Gilbert"]
  s.email       = ["danielcgilbert@gmail.com"]

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
end
