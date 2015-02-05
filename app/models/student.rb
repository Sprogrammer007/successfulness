class Student < User

  def assign_group
    self.group_id = 3
    return self
  end

end