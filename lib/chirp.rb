require "net/http"
require "uri"
require "chirp/experiment"

module Chirp

  CHIRP_API_HOST = "http://localhost:3000"

  def experiment(slug, &block)
    # Make API request for a serving for the experiment defined in the slug.
    uri = URI.parse("#{ CHIRP_API_HOST }/api/v1/experiments/#{ slug }/serving")

    response = Net::HTTP.get_response(uri)

    variant = JSON.parse(response.body)

    experiment = Chirp::Experiment.new(:variant => variant)

    # Yield the served variant.
    yield experiment
  end
end
