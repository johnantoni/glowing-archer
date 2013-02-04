String.class_eval do

  # generate html for bootstrap badges (tags)
  def bootstrap_badges(style = "")
    badges = self
    style = (" " + style) unless style.nil_or_empty?
    html = ""
    badges.split(",").each do |badge|
      badge = badge.strip
      html << "<span class=\"label#{style}\">#{badge.html_safe!}</span> " unless badge.nil_or_empty?
    end
    return html.html_safe
  end

  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end

  def uncapitalize
    self[0, 1].downcase + self[1..-1]
  end

  def append_url_params(params)
    param_str = params.stringify_keys.reject {|k,v| v.blank? || self =~ /[\?&]#{CGI.escape(k)}=/}.map{|k,v|"#{CGI.escape(k)}=#{CGI.escape(v)}"}.join('&')
    return self if param_str.blank?

    [self, param_str].join(self.index('?') ? '&' : '?')
  end

  def truncate(n)
    self[0...n]
  end

  def parse_brackets
    self.scan(/\((.*?)\)/).flatten
  end

  def parse_curly_brackets
    self.scan(/\{(.*?)\}/).flatten
  end

  def remove_brackets
    self[(self.rindex(")") + 1)..-1].strip
  end

  def is_a_number?
    self.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def html_safe!
    CGI::escapeHTML(self)
  end

  # miss this method from js
  def trim
    self.strip
  end

  # get first character of string
  def initial
    self[0,1]
  end

  # get first character of string and titleize
  def initial!
    self.initial.upcase + "."
  end

end

class NilClass
  def nil_or_empty?
    true
  end
end

class String
  def nil_or_empty?
    empty?
  end
end
