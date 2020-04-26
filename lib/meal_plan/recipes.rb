class MealPlan::Recipe
  @@all = []
  attr_accessor :name, :tag, :cuisine, :teaser, :url

  def initialize(name, tag, cuisine, teaser = nil, url)
    @name = name
    @tag = tag
    @cuisine = cuisine
    @teaser = teaser
    @url = url
    add_recipes_to_tag
    save
  end

  def self.all
    @@all
  end

  def add_recipes_to_tag
    # binding.pry
    tag.recipes << self unless tag.recipes.include?(self)
    # self = #<MealPlan::Recipes:0x000000000275d148 @name="", @tag="", @teaser="">
  end

  def save
    @@all << self
  end

end
