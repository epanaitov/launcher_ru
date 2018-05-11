class SearchController < MainController

  def search

    @params = {}

    name = ""
    tmp = []
    
    if params[:other].size < 2
      tmp = params[:other][0].split '/' unless params[:other].blank?
    else
      tmp = params[:other]
    end

    tmp.each_index do |i|
      if i % 2 == 1

        value = tmp[i]
        
        if value.include? ","
          @params[name] = value.split ","
        elsif value.include? "-"
          @params[name] = {}
          @params[name][:min], @params[name][:max] = value.split "-"
        else
          @params[name] = value
        end
        
      else
        name = tmp[i]
      end
    end

    sql = "SELECT *,
            h.name as hull_name,
            h.slug as hull_slug,
            CONCAT(',',GROUP_CONCAT(DISTINCT p.slug ORDER BY p.id ASC SEPARATOR ','),',') as prop_slugs,
            CONCAT(',',GROUP_CONCAT(DISTINCT m.slug SEPARATOR ','),',') as mfg_slugs,
            GROUP_CONCAT(DISTINCT m.name SEPARATOR ', ') as mfg_names,
            GROUP_CONCAT(DISTINCT p.type ORDER BY p.id ASC SEPARATOR '|') as prop_types,
            GROUP_CONCAT(DISTINCT p.title ORDER BY p.id ASC SEPARATOR '|') as prop_titles
           FROM hulls h
           LEFT JOIN hulls_properties hp ON h.id = hp.hull_id
           LEFT JOIN properties p ON p.id = hp.property_id
           LEFT JOIN hulls_manufacturers hm ON h.id = hm.hull_id
           LEFT JOIN manufacturers m ON m.id = hm.manufacturer_id
          "

    where = [[], []]

    props = %w(material deck_type transom_height mover_type)

    props.each do |prop|
      unless @params[prop].blank?
        if @params[prop].is_a? String
          where[0] << '(LOCATE(?, prop_slugs) > 0)'
          where[1] << ','+@params[prop]+','
        elsif @params[prop].is_a? Array
          tmp = []
          @params[prop].each do |slug|
            tmp << '(LOCATE(?, prop_slugs) > 0)'
            where[1] << ','+slug+','
          end
          where[0] << '('+tmp.join(' OR ')+')'
        end
      end
    end

    unless @params['manufacturer'].blank?
      if @params['manufacturer'].is_a? String
        where[0] << '(LOCATE(?, mfg_slugs) > 0)'
        where[1] << ','+@params['manufacturer']+','
      elsif @params['manufacturer'].is_a? Array
        tmp = []
        @params['manufacturer'].each do |slug|
          tmp << '(LOCATE(?, mfg_slugs) > 0)'
          where[1] << ','+slug+','
        end
        where[0] << '('+tmp.join(' OR ')+')'
      end
    end

    own = %w(deadrise length width height weight)

    own.each do |prop|
      unless @params[prop].blank?
        tmp = []
        if @params[prop].is_a? Hash
          unless @params[prop][:min].blank?
            tmp << 'h.'+prop+' >= ?'
            where[1] << @params[prop][:min]
          end

          unless @params[prop][:max].blank?
            tmp << 'h.'+prop+' <= ?'
            where[1] << @params[prop][:max]
          end
          where[0] << '('+tmp.join(' AND ')+')'
        else
          where[0] << '(h.'+prop+' = ?)'
          where[1] << @params[prop]
        end
      end
    end

    unless @params['power'].blank?
      where[0] << '((h.power_max >= ?) AND (h.power_min <= ?))'

      if @params['power'][:min].blank?
        where[1] << 0
      else
        where[1] << @params['power'][:min]
      end

      if @params['power'][:max].blank?
        where[1] << 999999
      else
        where[1] << @params['power'][:max]
      end
    end
    

    #sql << 'WHERE ' + Hull.send(:sanitize_sql_for_conditions, [where[0].join(' AND ')] + where[1]) if where[0].size > 0

		#fucking spammers
		sql << " WHERE h.reviewed = 1"

    sql << " GROUP BY h.id "

    sql << 'HAVING ' + Hull.send(:sanitize_sql_for_conditions, [where[0].join(' AND ')] + where[1]) if where[0].size > 0

    @sql = sql

    @hulls = Hull.find_by_sql sql

    @title = ''

    meta = []

    properties = {}

    Property.all.each do |pp|
      properties[pp[:slug]] = pp[:title]
    end

    @params.each_pair do |key, value|
      tmp = []

      if LEXIS.include? key
        tmp << LEXIS[key][0]
      else  
        #tmp << key.to_s
      end
      
      if value.is_a? Hash
        if !value[:min].blank?
          tmp << 'от ' + value[:min].to_s
        end
        if !value[:max].blank?
          tmp << 'до ' + value[:max].to_s
        end
      elsif value.is_a? Array
        tmp2 = []
        value.each do |vv|
          tmp2 << properties[vv] if properties.include? vv
        end
        tmp << tmp2.join(',')
      else
        tmp << properties[value] if properties.include? value
      end

      if LEXIS.include? key
        tmp << LEXIS[key][1]
      end

      meta << tmp.join(' ')
    end

    @title = @keywords = meta.join(', ')
    @description = "Сравнение катеров и лодок с параметрами: " + meta.join(', ')

    @search = Search.new

  end

end
