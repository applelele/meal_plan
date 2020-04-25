class MealPlan::Tag
  @@all = []
  # ["Kebab", "Turmeric", "Szechuan", "Cheese", "Egg", "Lamb", "Pasta"]
  attr_accessor :name

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    MealPlan::Scraper.scrape_tag if @@all.empty?
    @@all
  end
end
