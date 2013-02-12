Array.class_eval do
  def to_h
    Hash[*self.flatten]
  end

  def drop_nil
    delete_if {|x| x == nil || x == ''}
  end

  def to_csv(sep = ', ')
    self.join(sep)
  end
end
