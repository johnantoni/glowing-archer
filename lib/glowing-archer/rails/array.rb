Array.class_eval do
  def to_h
    Hash[*self.flatten]
  end

  def drop_nil
    delete_if {|x| x == nil || x == ''}
  end

  def to_csv(sep = ', ')
    [*self].drop_nil.join(sep)
  end
end
