class MealPlan::Recipes
  @@all = []
  attr_accessor :name, :tag, :teaser

  def initialize(name, tag, teaser = nil)
    @name = name
    @tag = tag
    @teaser = teaser
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
