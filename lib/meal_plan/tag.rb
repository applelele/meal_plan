class MealPlan::Tag
  @@all = []
  # ["Kebab", "Turmeric", "Szechuan", "Cheese", "Egg", "Lamb", "Pasta"]
  attr_accessor :name
  attr_writer :recipes

  def initialize(name)
    @name = name
    @recipes = []
    save
  end

  def self.all
    MealPlan::Scraper.scrape_tag if @@all.empty?
    @@all
  end

  def recipes
    # binding.pry
    MealPlan::Scraper.scrape_recipes(self) if @recipes.empty?
    # self == #<MealPlan::Tag:0x0000000002cff128 @name="Taco">
    MealPlan::Recipes.all
  end

  def save
    @@all << self
  end

end
