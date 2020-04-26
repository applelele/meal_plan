class MealPlan::Tag
  attr_accessor :name, :recipes
  @@all = []
  # ["Kebab", "Turmeric", "Szechuan", "Cheese", "Egg", "Lamb", "Pasta"]

  def initialize(name)
    @name = name
    @recipes = []
    save
  end

  def self.all
    MealPlan::Scraper.scrape_tags if @@all.empty?
    @@all
  end

  def get_recipes
    # binding.pry
    MealPlan::Scraper.scrape_recipes(self) #if @recipes.empty?
    # self ===> #<MealPlan::Tag:0x0000000001a56170 @name="Taco", @recipes=[]>
  end

  def save
    @@all << self
  end

end
