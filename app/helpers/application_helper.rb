module ApplicationHelper
  def sortable(model, column, title = nil)
    title ||= column.titleize  
    direction = (column == sort_column(model, title) && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction  
  end

  def active_link_text(obj)
    obj.deleted? ? 'Active' : 'In-Active'
  end

  def stock_link_text(obj)
    obj.stock? ? 'In' : 'Out'
  end

  def faulty_link_text(obj)
    obj.faulty? ? 'Yes' : 'No'
  end
  
  def returned_link_text(obj)
    obj.returned? ? 'Yes' : 'No'
  end
end