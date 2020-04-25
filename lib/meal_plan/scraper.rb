class MealPlan::Scraper
  def scrape_tag
    url = https://food52.com/sitemap
    doc = Nokogiri::HTML(open(url))
  end
end
