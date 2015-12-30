class TherapistSearch
  def initialize(searcher)
    @searcher = searcher
    @distance ||= 50
  end

  attr_reader :distance, :searcher

  def set_distance(range)
    @distance = range
  end

  def find
    Therapist.near([searcher.latitude, searcher.longitude], distance)
  end
end