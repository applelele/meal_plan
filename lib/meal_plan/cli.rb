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
    @input = ""
    until @input == "exit"
      get_exist_keywords
      get_list_keywords
      get_user_keyword
    end
    goodbye
  end

  def get_exist_keywords
    # MealPlan::Tag.new("Kebab")
    # MealPlan::Tag.new("Cheese")
    @keywords = MealPlan::Tag.all
    # binding.pry
  end

  def get_list_keywords
    puts "Choose a keyword to see a recipe"
    @keywords.each do |keyword|
      puts "- #{keyword.name}"
    end
  end

  def get_user_keyword
    keyword = gets.strip.capitalize
    if valid_input(keyword, @keywords)
      show_recipes_for(keyword)
    else
      puts "Try a different keyword."
    end

  end

  def valid_input(input, data)
    data.each {|tag| tag.name == input}
  end

  def show_recipes_for(keyword)

    tag = @keywords.find {|k| k.name == keyword} # tag == instance object
    tag.get_recipes
    puts "Here are recipes for #{keyword}"
    tag.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name}\n#{recipe.tag.name}\n#{recipe.teaser}"
    end
    # MealPlan::Tag.all.each.with_index(1) do |tag|
    #   puts tag.name
    # end
  end

  def goodbye
    puts "Enjoy the meal!"
  end

end
