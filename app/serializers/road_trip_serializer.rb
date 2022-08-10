class RoadTripSerializer
  def self.format_roadtrip(roadtrip)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          "start_city": roadtrip.start_city,
          "end_city": roadtrip.end_city,
          "travel_time": roadtrip.travel_time
        }
      }
    }
  end
end
