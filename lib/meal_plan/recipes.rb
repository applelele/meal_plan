class MealPlan::Recipes
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
  end

  def save
    @@all << self
  end

end
