class BaseService
  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
