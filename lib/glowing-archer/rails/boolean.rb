module BooleanHelpers
  def humanize
    self ? "yes" : "no"
  end
end

class FalseClass
  include BooleanHelpers
end

class TrueClass
  include BooleanHelpers
end

