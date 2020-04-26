class MealPlan::Recipe
  @@all = []
  attr_accessor :name, :tag, :teaser

  def initialize(name, tag, teaser = nil)
    @name = name
    @tag = tag
    @teaser = teaser
    add_recipes_to_tag
    save
  end

  def self.all
    @@all
  end

  def add_recipes_to_tag
    # binding.pry
    @tag.recipes << self unless @tag.recipes.include?(self)
    # self = #<MealPlan::Recipes:0x000000000275d148 @name="", @tag="", @teaser="">
  end

  def save
    @@all << self
  end

end
