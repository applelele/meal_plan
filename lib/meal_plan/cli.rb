class MealPlan::CLI
  attr_accessor :keywords

  def call
    puts "Which menu will be your dinner tonight?"
    # binding.pry
    # get_exist_keywords
    # get_list_keywords
    # get_user_keyword
    # get_recipes
    # list_recipes
    get_exist_keywords
    get_list_keywords
    get_user_keyword
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
    keyword = gets.strip.capitalize
    show_recipes_for(keyword) if valid_input(keyword, @keywords)
  end

  def valid_input(input, data)
    data.include?(input)
  end

  def show_recipes_for(keyword)
    puts "Here are recipes for #{keyword}"
    # binding.pry
    MealPlan::Recipe.all.each.with_index(1) do |recipe|
      puts recipe.name
    end
  end

end
