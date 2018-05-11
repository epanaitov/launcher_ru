# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end


class String
  def to_slug
    # Perform transliteration to replace non-ascii characters with an ascii
    # character
    value = Russian.translit(self)
    value = value.mb_chars.normalize(:kd).to_s

    value.gsub!(/[^\x00-\x7F]/n, '').to_s


    # Remove single quotes from input
    value.gsub!(/[']+/, '')

    # Replace any non-word character (\W) with a space
    value.gsub!(/\W+/, ' ')

    # Remove any whitespace before and after the string
    value.strip!

    # All characters should be downcased
    value.downcase!

    # Replace spaces with dashes
    value.gsub!(' ', '-')

    # Return the resulting slug
    value
  end
end

class Hash
  def fix_commas
    result = {}
    self.each_key do |index|
      result[index] = self[index]
      if self[index].is_a? String
        result[index].gsub!(/\,/, '.')
      end
    end
    return result
  end
end