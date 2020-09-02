class Doctor
    attr_accessor :name, :appointment

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
        @appointments = []
    end

    def self.all
        @@all
    end
    
    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients
        self.appointments.collect {|appointment| appointment.patient}
    end

    def new_appointment (date,patient)
        appointment = Appointment.new(date,patient,self)
    end

end