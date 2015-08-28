class ReservationConfirmationMailer < ActionMailer::Base
   def reservation_confirm_email(reservation)
       #mail(:to => reservation.customer.email, :from => "medhidayat9@gmail.com",:subject => "[Konfirmasi Paket Wisata]")
       @customer = reservation.customer.name
       @date_booked = reservation.date_booked.strftime("%d-%B-%Y %H:%M")
       @date_created = reservation.created_at.strftime("%d-%B-%Y") 
       @name_vacation_packet = VacationPacket.find(reservation.vacation_packet_id).title
       @games = reservation.reservation_games
       @kid_count = reservation.kid_count
       @adult_count = reservation.adult_count
       @foods = reservation.reservation_food
       @additional_packets = reservation.reservation_additional_packets
       @total = reservation.total
       @status = reservation.status
       @transaction_code = reservation.transaction_code
       
       mail(:to => 'medhidayat9@gmail.com', :from => "ahmadhidayat@fellow.lpkia.ac.id",:subject => "[Konfirmasi Paket Wisata]")
  end
end
