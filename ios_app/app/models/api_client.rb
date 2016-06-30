class ApiClient
  class << self

    def client
      @client ||= AFMotion::SessionClient.build("http://localhost:3000/") do
        mp "building client"
        request_serializer :json
        response_serializer :json
        header "Content-Type", "application/json"
      end
    end

    def update_authorization_header(headers_hash)
      mp "updating auth headers"
      headers_hash.each do |key, value|
        client.headers[key] = value
      end
    end

  end
end
