module ApplicationHelper
  def full_title(page_title)
      base_title = "Agentify - Find verified agents all over Nigeria."
      page_title.empty? ? base_title : "Agentify - #{page_title}"
    end
end
