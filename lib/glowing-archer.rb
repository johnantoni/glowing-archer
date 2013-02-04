module Glowing
  module Archer

    # generate html for bootstrap badges (tags)
    def bootstrap_badges(badges, style = "")
      style = (" " + style) unless style.nil_or_empty?
      html = ""
      badges.split(",").each do |badge|
        badge = badge.strip
        html << "<span class=\"label#{style}\">#{badge.html_safe!}</span> " unless badge.nil_or_empty?
      end
      return html.html_safe
    end

    # generate unique key http://railscasts.com/episodes/124-beta-invitations
    def invite_code
      Digest::SHA1.hexdigest([Time.now, rand].join)
    end
    
  end
end

require 'find'

# load all extensions
extensions_directory = File.expand_path("glowing-archer/rails", File.dirname(__FILE__))

Find.find(extensions_directory) do |path|
   next if File.extname(path) != ".rb"
   #puts "loading core extension: #{path}"
   require path
end
