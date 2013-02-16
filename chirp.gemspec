$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chirp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chirp-rb"
  s.version     = Chirp::VERSION
  s.authors     = ["Dan Gilbert"]
  s.email       = ["danielcgilbert@gmail.com"]
  s.homepage    = "http://www.drtangible.com"
  s.summary     = "Ruby client for Chirp, an A/B testing service."
  s.description = "Ruby client for Chirp, an A/B testing service."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc", "lib/chirp.rb"]
  s.test_files = Dir["test/**/*"]
end
