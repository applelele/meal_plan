class MealPlan::CLI

  def call
    puts "Welcome to Meal Plan"
    # binding.pry
    # get_exist_keywords
    # get_user_keyword
    # get_recipes
    # list_recipes
  end

  def get_exist_keywords
    @keywords = [Kebab, Turmeric, Szechuan, Cheese, Egg, Lamb, Pasta]
  end

  def get_user_keyword
    @keywords.each.with_index do |keyword, index|
      puts "#{index}. #{keyword}"
    end
  end
end
