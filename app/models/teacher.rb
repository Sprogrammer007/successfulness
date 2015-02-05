class Teacher < User

  def assign_group
    self.group_id = 2
    return self
  end
end