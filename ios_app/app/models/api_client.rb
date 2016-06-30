class ApiClient
  class << self
    def client
      @client ||= AFMotion::SessionClient.build("http://localhost:3000/") do
        response_serializer :json
        header "Content-Type", "application/json"
      end
    end

    def update_authorization_header(headers_hash)
      headers_hash.each do |key, value|
        client.headers[key] = value
      end
    end
  end
end
