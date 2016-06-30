class Match
  attr_accessor :id, :match_type

  def initialize(data)
    @id = data["id"]
    # @player2_id = data["player2_id"]
    @match_type = data["match_type"]
    # @bet = data["bet"]
  end

  def self.all(&callback)

    ApiClient.client.get "matches" do |response|
      models = []
      if response.success?
        mp response.object["data"][0]["id"]
        mp response.object["data"][0]["attributes"]["match_type"]
        mp response.object["data"][0].map {|data| data }
      #   models = response.object["data"][0].map {|data| new(data) }
        models = new(id: response.object["data"][0].map {|data| new(data) }
      end
      callback.call(response, models)
    end
  end

  def self.get(&callback)
    ApiClient.client.get "match/#{@id}" do |response|
      model = nil
      if response.success?
        model = response.object.map {|data| new(data) }
      end
      callback.call(response, model)
    end
  end

  def self.create(data, &callback)
    ApiClient.client.post "matches", meme: data do |response|
      model = nil
      if response.success?
        model = new(response.object)
      end
      callback.call(response, model)
    end
  end
end
