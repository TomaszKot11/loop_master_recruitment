# frozen_string_literal: true

class ApplicationService
  def initialize(service_params:)
    @flash = service_params[:flash]
    service_params.delete(:flash)
    @service_params = service_params
  end
end
