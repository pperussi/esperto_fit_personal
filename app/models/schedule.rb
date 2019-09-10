class Schedule < ApplicationRecord
  belongs_to :unit
  belongs_to :account

  validates :date, :start, :finish, :price, :unit_id, :account_id, presence: true
  validates :price, numericality: { greater_than: 0 }

  def create_appointments
    (self.start..self.finish).each do |x| 
      appm = Appointment.create(date_appointment: self.date, start_hour: x, end_hour: x+1, available: false, account: self.account)
      CustomerAppointment.create(appointment: appm, name_class: "Aulas com Personal")
    end
  end
end
