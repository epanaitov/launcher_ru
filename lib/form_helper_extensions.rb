module ActionView
  module Helpers
    class FormBuilder
      def suggest_text_field(method, options = {})
        @template.render  :partial => 'helpers/forms/suggest_text_field',
                          :locals => {
                            :object => @object,
                            :object_name => @object_name,
                            :method => method,
                            :options => options
                          }
      end
    end
  end
end