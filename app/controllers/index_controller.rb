class IndexController < MainController

  

  def index

    @search = Search.new

    @last = Hull.all :order => 'updated_at DESC', :limit => 10, :conditions => ["reviewed = 1"]

  end



  def forward

    query = {}

    acceptable = ['power', 'deadrise', 'length', 'weight', 'height', 'width', 'mover_type', 'deck_type', 'material', 'transom_height', 'manufacturer', 'configuration']

    params.each_pair do |key, value|

      next unless acceptable.include?(key)
      next if value.blank?

      if value.is_a? Hash
        
        if value.has_key?('min') or value.has_key?('max')

          tmp = []

          empty = true

          if value[:min].to_f > 0.0
            tmp << value[:min].gsub(/\,/, '.').to_f
            empty = false
          else
            tmp << ""
          end

          if value[:max].to_f > 0.0
            tmp << value[:max].gsub(/\,/, '.').to_f
            empty = false
          else
            tmp << ""
          end

          next if empty

          query[key] = tmp.join('-')
        else
          next if value.values.blank?
          query[key] = value.values.join(',')
        end
      else
        query[key] = value
      end
    end

    redirect_to '/search/'+query.to_a.flatten.join('/')
  end

end
