class Numeric
  def percents
    self * 100
  end

  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end