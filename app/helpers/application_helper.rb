# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def pick_props(name, props)
    if props.is_a? Hash
      return props[name].join(', ') unless props[name].blank?
    end

    if props.is_a? Array
      tmp = []
      props.each do |prop|
        tmp << prop[:title] if prop.type == name
      end
      return tmp.join(', ')
    end
  end

  def googleadlist
    return '<div class="googleadlist"><script type="text/javascript"><!--
google_ad_client = "ca-pub-8326169512608371";
/* launcha - 728 x 90 */
google_ad_slot = "8047764545";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>'
  end

  def googleadright
    return '<script type="text/javascript"><!--
google_ad_client = "ca-pub-8326169512608371";
/* launcha - 160x600 */
google_ad_slot = "4247272660";
google_ad_width = 160;
google_ad_height = 600;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>'
  end

end
