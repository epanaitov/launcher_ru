class SitemapController < ApplicationController
  def index

    @sitemap = []

    @sitemap << {
        :loc => '/',
        #:lastmod => hull[:updated_at],
        :changefreq => 'daily',
        :priority => 0.9
        }

    Hull.all.each do |hull|
      @sitemap << {
        :loc => '/hulls/'+hull[:slug]+'/',
        #:lastmod => hull[:updated_at],
        :changefreq => 'daily',
        :priority => 0.7
        }
    end

    Manufacturer.all.each do |mfg|
      @sitemap << {
        :loc => '/manufacturers/'+mfg[:slug]+'/',
        :lastmod => mfg[:updated_at],
        :changefreq => 'monthly',
        :priority => 0.5
        }
    end

    Material.all.each do |row|
      @sitemap << {
        :loc => '/search/material/'+row[:slug]+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

    DeckType.all.each do |row|
      @sitemap << {
        :loc => '/search/deck_type/'+row[:slug]+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

    TransomHeight.all.each do |row|
      @sitemap << {
        :loc => '/search/transom/'+row[:slug]+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

    MoverType.all.each do |row|
      @sitemap << {
        :loc => '/search/mover_type/'+row[:slug]+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

    ['-15', '15-30', '30-40', '40-50', '50-60', '60-90', '90-'].each do |p|
      @sitemap << {
        :loc => '/search/power/'+p+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

    ['-3.0', '3.0-4.5', '4.5-5.0', '5.0-5.5', '5.5-6.5', '6.0-'].each do |l|
      @sitemap << {
        :loc => '/search/length/'+l+'/',
        #:lastmod => mfg[:updated_at],
        :changefreq => 'weekly',
        :priority => 0.9
        }
    end

  end

end
