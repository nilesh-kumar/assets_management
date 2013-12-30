module ApplicationHelper
  def sortable(model, column, title = nil)
    title ||= column.titleize  
    direction = (column == sort_column(model, title) && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction  
  end     
end