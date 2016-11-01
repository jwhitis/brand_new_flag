module ApplicationHelper

  def header_has_callout?
    content_for(:header) =~ /callout/
  end

  def order_link options = {}
    options[:class] = "button " + options[:class].to_s

    link_to "https://lastchancerecords.merchtable.com", options do
      fa_icon("angle-double-right") + "Order the Album"
    end
  end

  def star number
    content_tag(:div, class: "star") do
      fa_icon("star") + content_tag(:span, number)
    end
  end

  def facebook_share_link
    query_params = { app_id: AppConfig["facebook_app_id"], href: "http://www.twocowgarage.net" }
    url = "https://www.facebook.com/dialog/share?#{query_params.to_query}"
    share_link(url, "facebook")
  end

  def twitter_share_link
    text = "The new Two Cow Garage album \"Brand New Flag\" is here! @twocowgarage1"
    query_params = { text: text, url: "http://www.twocowgarage.net", hashtags: "TwoCowGarage,BrandNewFlag" }
    url = "https://twitter.com/intent/tweet?#{query_params.to_query}"
    share_link(url, "twitter")
  end

  def share_link url, icon
    link_to url, target: "_blank", class: "button" do
      fa_icon(icon) + "Share"
    end
  end

end