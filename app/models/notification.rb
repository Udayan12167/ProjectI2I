class Notification < ActiveRecord::Base
	belongs_to :user

	def relative_time(start_time)
  	diff_seconds = (Time.now - start_time).to_i
  	case diff_seconds
    when 0 .. 59
      return " about #{diff_seconds} seconds ago"
    when 60 .. (3600-1)
      return "about #{diff_seconds/60} minutes ago"
    when 3600 .. (3600*24-1)
      return "about #diff_seconds/3600} hours ago"
    when (3600*24) .. (3600*24*30) 
      return "about #{diff_seconds/(3600*24)} days ago"
    else
      return start_time.strftime("%m/%d/%Y")
  end
end
end
