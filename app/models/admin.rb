class Admin < User

  def assign_group
    self.group_id = 1
    return self
  end
end
