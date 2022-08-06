class BaseService
  def self.get_json
    JSON.parse(response.body, symbolize_names: true)
  end
end
