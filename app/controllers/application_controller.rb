require "slimmer/headers"
require 'gds_api/helpers'

class ApplicationController < ActionController::Base
  protect_from_forgery

  include Slimmer::Headers
  include GdsApi::Helpers

  before_filter :load_artefact

  after_filter :set_app_slimmer_headers

  private

  def load_artefact
    unless Rails.env.development? #remove me once I rebuild my vm
      @artefact = content_api.artefact(APP_SLUG)
      set_slimmer_artefact(@artefact)
    end
  end

  def set_app_slimmer_headers
    unless Rails.env.development? #remove me once I rebuild my vm
      set_slimmer_headers(
        format:               "custom-tool",
        remove_meta_viewport: true
      )
    end
  end
end
