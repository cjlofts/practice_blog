module ApplicationHelper
  def formatted_date(date)
    date.strftime("%Y-%b-%d")
  end

  def time_written(date)
    date.strftime("%H:%M GMT")
  end
end
