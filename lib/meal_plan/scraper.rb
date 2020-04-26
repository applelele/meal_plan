class MealPlan::Scraper

  def self.scrape_tags
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
    direction = tag.name.gsub(" ", "-")
    url = open("https://food52.com/tags/#{direction}")
    doc = Nokogiri::HTML(url)
    posts = doc.css(".tag-post")
    i = 1
    until i == posts.count
      binding.pry
      name = doc.css(".tag-post:nth-child(i) .tag-post__header").text.strip
      tag = doc.css(".tag-post:nth-child(i) .tag-post__rubric").text.strip
      teaser = doc.css(".tag-post:nth-child(i) .tag-post__teaser").text.strip
      MealPlan::Recipe.new(name, tag, teaser)
      i += 1
    end
  end

end
