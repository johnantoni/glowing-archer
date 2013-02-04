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

    # generate invite code http://railscasts.com/episodes/124-beta-invitations
    # => "bf35184b0e7ebb5baad116bfe4a8dbdfb58277d2"
    def invite_code
      Digest::SHA1.hexdigest([Time.now, rand].join)
    end
    
    # generate random key #2 http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails
    # => "Sk349WNovoUDRZ930Uha"
    def secure_key(length = 15)
      SecureRandom.base64(length).tr('+/=', '0aZ').strip.delete("\n")
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
