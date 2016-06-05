module ApplicationHelper

  def header_has_callout?
    content_for(:header) =~ /callout/
  end

  def pre_order_button options = {}
    options[:class] = "button " + options[:class].to_s

    link_to "javascript:void(0)", options do
      fa_icon("angle-double-right") + "Pre-Order the Album"
    end
  end

  def star number
    content_tag(:div, class: "star") do
      fa_icon("star") + content_tag(:span, number)
    end
  end

end