class MealPlan::Scraper
  def self.scrape_tag
    url = open("https://food52.com/sitemap")
    doc = Nokogiri::HTML(url)
    # binding.pry
  end
end
