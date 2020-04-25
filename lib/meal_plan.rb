# enviroment file
require_relative "./meal_plan/version"
require_relative "./meal_plan/cli"
require_relative "./meal_plan/tag"
require_relative "./meal_plan/scraper"

require "pry"
require "nokogiri"

module MealPlan
  class Error < StandardError; end
  # Your code goes here...
end
