module ApplicationHelper
  def format_time(time)
    time.strftime("%m/%d/%Y at %I:%M %p")
  end
end
