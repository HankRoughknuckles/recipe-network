module Requests
  module JsonHelpers
    def json_output
      JSON.parse(response.body)
    end
  end
end
