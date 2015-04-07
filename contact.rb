class Contact
    attr_accessor :first_name
    attr_accessor :last_name
    attr_accessor :email
    attr_accessor :notes
    attr_accessor :id
    def initialize(fn, ln, email, notes, id)
        @first_name = fn
        @last_name = ln
        @email = email
        @notes = notes
        @id = id
    end
    def read_attribute(attribute)
        case attribute
        when 1 then return @first_name
        when 2 then return @last_name
        when 3 then return @email
        when 4 then return @notes
        else
            return nil
        end
    end
    def write_attribute(attribute, value)
        case attribute
        when 1 then @first_name = value
        when 2 then @last_name = value
        when 3 then @email = value
        when 4 then @notes = value
        else
            return nil
        end
    end
    def to_s
        "id: #{@id}\nname: #{@last_name}, #{@first_name}\ne-mail: #{@email}\nNotes: #{@notes}"
    end
end
