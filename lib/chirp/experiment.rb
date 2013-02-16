module Chirp
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
