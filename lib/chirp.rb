require "net/http"
require "uri"

class Chirp

  CHIRP_API_HOST = "http://localhost:3000"

  def self.experiment(slug, &block)
    # Make API request for a serving for the experiment defined in the slug.
    uri = URI.parse("#{ CHIRP_API_HOST }/api/v1/experiments/#{ slug }/serving")

    response = Net::HTTP.get_response(uri)

    variant = JSON.parse(response.body)

    experiment = Chirp::Experiment.new(:variant => variant)

    # Yield the served variant.
    yield experiment
  end

  class Experiment
    def initialize(options)
      @served_variant = options[:variant]
    end

    def variant(slug, &block)
      yield if slug == served_variant_slug
    end

    def served_variant_slug
      @served_variant_slug ||= @served_variant["slug"]
    end
  end
end
