module UsersHelper
  def get_avatar
    self.avatar.nil? ? 'generic.jpg' : self.avatar
  end

  def display_name
    self.first_name.nil? ? self.email : self.first_name
  end
end
