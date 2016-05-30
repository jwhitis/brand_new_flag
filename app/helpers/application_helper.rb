module ApplicationHelper

  def flash_message_classes name
    classes = %w(alert fade in flash-message alert-dismissible)
    classes << "alert-info" if name == "notice"
    classes << "alert-danger" if name == "alert"
    classes.join(" ")
  end

end