module ApplicationHelper

  def icon(icn_class)
    "<i class ='#{icn_class}'></i>".html_safe
  end

end
