module DevicesHelper
  def active_link_text(device)  
    device.deleted? ? 'Active' : 'In-Active'  
  end
  def stock_link_text(device)  
    device.stock? ? 'In' : 'Out'  
  end
  def faulty_link_text(device)  
    device.faulty? ? 'Yes' : 'No'  
  end
  def returned_link_text(device)  
    device.returned? ? 'Yes' : 'No'  
  end
end
