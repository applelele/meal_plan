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
    @input = "list"
    until @input == "exit"
      get_exist_keywords
      get_list_keywords
      get_user_keyword
      done
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
    puts "Type a keyword to see a recipe"
    @keywords.each do |keyword|
      puts "- #{keyword.name}"
    # @keywords.each do |keyword|
    #   puts "- #{keyword.name}"
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

    tag = @keywords.find {|k| k.name == keyword} # get an instance object & assign it to tag
    tag.get_recipes
    # binding.pry
    puts "Here are recipes for #{keyword}"
    tag.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. [#{recipe.tag.name}] #{recipe.name}\n#{recipe.cuisine}\n#{recipe.teaser}\nView the recipe => #{recipe.url}\n\n"
    end

  end

  def done
    puts "Please type list to see menu again or type exit if you are done."
    @input = gets.strip
  end

  def goodbye
    puts "Enjoy the meal!"
  end

end
