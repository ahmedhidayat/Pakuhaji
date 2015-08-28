module ApplicationHelper
  def name_packet(id)
    result = VacationPacket.find(id).title
    return result
   end
end
