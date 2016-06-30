class User
  attr_accessor :id, :email

  def initialize(data)
    @id = data["id"]
    @email = data["attributes"].nil? ? data["email"] : data["attributes"]["email"] # necessary to support current_user
  end

  def self.all(&callback)

    ApiClient.client.get "users" do |response|
      users = []
      if response.success?
        mp response.object["data"][0]["id"]
        users = response.object["data"][0].map {|data| data }
      end
      callback.call(response, models)
    end
  end

  def self.create(data, &callback)
    ApiClient.client.post "auth/sign_up", user: data do |response|
      model = nil
      if response.success?
        model = new(response.object)
      end
      callback.call(response, model)
    end
  end
end
