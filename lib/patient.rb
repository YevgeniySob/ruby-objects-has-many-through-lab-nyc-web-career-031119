class Patient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    appointments.map {|appointment| appointment.doctor}
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end



end
