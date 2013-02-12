module BooleanHelpers
  def humanize
    self ? "yes" : "no"
  end
  def yesno
    self ? "Yes" : "No"
  end
end

class FalseClass
  include BooleanHelpers
end

class TrueClass
  include BooleanHelpers
end
