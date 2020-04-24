class MealPlan::CLI
  attr_accessor :keywords

  def call
    puts "Welcome to Meal Plan"
    # binding.pry
    # get_exist_keywords
    # get_list_keywords
    # get_user_keyword
    # get_recipes
    # list_recipes
    get_exist_keywords
    get_list_keywords
  end

  def get_exist_keywords
    @keywords = ["Kebab", "Turmeric", "Szechuan", "Cheese", "Egg", "Lamb", "Pasta"]
  end

  def get_list_keywords
    puts "Choose a keyword to see a recipe"
    @keywords.each.with_index(1) do |keyword, index|
      puts "#{index}. #{keyword}"
    end
  end

  def get_user_keyword
    keyword = gets.strip
  end

end
