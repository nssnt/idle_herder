# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://idleheroes.com'

SitemapGenerator::Sitemap.create do
  add '/about', priority: 1.2
  add '/about/contact', priority: 1.0
  Hero.find_each do |hero|
    add hero_path(hero)
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  #
  # Mark a page as expired (ask search engines to remove it):
  #
  #   add '/goodbye', :expires => Time.now + 2.weeks
end