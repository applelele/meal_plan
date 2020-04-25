# enviroment file
require_relative "./meal_plan/version"
require_relative "./meal_plan/cli"
require_relative "./meal_plan/tag"

require "pry"

module MealPlan
  class Error < StandardError; end
  # Your code goes here...
end
