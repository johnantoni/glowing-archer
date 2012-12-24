String.class_eval do

  def bootstrap_badges(style = "")
    style = (" " + style) unless style.nil_or_empty?
    html = ""
    self.split(",").each do |badge|
      badge = badge.strip
      html << "<span class=\"label#{style}\">#{badge.html_safe!}</span> " unless badge.nil_or_empty?
    end
    return html.html_safe
  end

end
