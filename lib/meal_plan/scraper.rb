class MealPlan::Scraper

  def self.scrape_tag
    url = open("https://food52.com/sitemap")
    doc = Nokogiri::HTML(url)
    # binding.pry
    tags = doc.css(".sitemap-page section:nth-child(5) ul li a")
    tags.each do |t|
     name = t.text
     MealPlan::Tag.new(name)
    end
  end

  def self.scrape_recipes(tag)
    MealPlan::Recipes.new("Tomato Bread", tag)
    MealPlan::Recipes.new("Squash Soup", tag)
  end

end
