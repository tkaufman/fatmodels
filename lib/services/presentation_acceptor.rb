module Services

  class PresentationAcceptor
    def initialize(abstract)
      @abstract = abstract
    end

    def execute
      @abstract.update_attribute(:status, "Accepted")
      scheduled_time = next_available_timeslot(@abstract.conference)
      Presentation.create(:abstract => @abstract,
                          :speaker => @abstract.speaker,
                          :conference => @abstract.conference,
                          :presented_on => scheduled_time)
      ConfirmationEmailer.send_email(@abstract.speaker.email, "Abstract Accepted", "Your abstract, '#{@abstract.title}' has been accepted!")
    end

    private

    def next_available_timeslot(conference)
      conference.begins.to_time
    end

  end

end