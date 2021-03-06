module MultiTimeTrackerHelper
  
  def formatted_time(logged_time)
    if logged_time.active
      seconds_at_all = (logged_time.spent_hours*3600 + (Time.now - logged_time.activated_at))
      t = Time.local(0) + seconds_at_all
      return (t.yday > 1 ? "#{t.yday}:#{t.strftime("%H:%M:%S")}" : t.strftime("%H:%M:%S"))
    else
      unless logged_time.activated_at.nil?
        t = Time.local(0) + logged_time.spent_hours*3600
        return (t.yday > 1 ? "#{t.yday}:#{t.strftime("%H:%M:%S")}" : t.strftime("%H:%M:%S"))
      end
      return "00:00:00"
    end
  end
  
end
