class Patient
    attr_accessor :name, :appointment

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
        @appointments = []
    end

    def new_appointment (date,doctor)
        appointment = Appointment.new(date,self,doctor)
    end

    def self.all
        @@all
    end

    def doctors
        appointments.collect {|appointment| appointment.doctor}
      end  

    def appointments
        Appointment.all.select {|appointment| appointment.patient == self}
    end


end