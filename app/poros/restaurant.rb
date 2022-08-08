class Restaurant
  attr_reader :name,
              :address

  def initialize(data)
    @name = data[:businesses].map { |business| business[:name] }
    @address = data[:businesses][0][:location][:display_address].join
  end
end
