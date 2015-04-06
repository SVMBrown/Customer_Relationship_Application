class Contact
    attr_accessor :first_name
    attr_accessor :last_name
    attr_accessor :email
    attr_accessor :notes
    attr_reader :id
    def initialize(fn, ln, email, notes)
        @first_name = fn
        @last_name = ln
        @email = email
        @notes = notes
        @id = nil
    end
    def id=(id)
        @id = id unless @id
    end
    def to_s
        "id: #{@id}\nname: #{@last_name}, #{@first_name}\ne-mail: #{@email}\nNotes: #{@notes}"
    end
end
class Rolodex
    def initialize
        @contacts = []
        @id = 1000
    end
    def add_contact(contact)
        contact.id = @id
        @contacts << contact
        @id += 1
    end
    def find_contact(id)
        selection = @contacts.find { |contact| contact.id == id }
        selection
    end
    def remove_contact(id)
        @contacts.reject! { |contact| contact.id == id }
    end
    def print_all
        @contacts.each do |c|
            puts "---------------------"
            puts c
        end
        puts "---------------------"
    end
end
class CRM
    def initialize
        @rolodex = Rolodex.new
    end
    def main_prompt
        puts "[1] Add a new contact"
        puts "[2] Modify an existing contact"
        puts "[3] Delete a contact"
        puts "[4] Display all contacts"
        puts "[5] Display an attribute"
        puts "[6] Exit"
        call_option(gets.chomp.to_i)
    end
    def call_option(selection)
        case selection
        when 1 then add_new_contact
        when 2 then modify_contact
        when 3 then delete_contact
        when 4 then display_all
        when 5 then display_attribute
        when 6 then exit
        else
            puts "invalid command, please try again."
            main_prompt
        end
    end
    def exit
        puts "exit called."
    end
    def add_new_contact
        puts "Add Contact"
        puts "-----------"
        print "First Name: "
        first_name = gets.chomp
        print "Last Name: "
        last_name = gets.chomp
        print "E-Mail: "
        email = gets.chomp
        print "Notes: "
        notes = gets.chomp
        @rolodex.add_contact(Contact.new(first_name, last_name, email, notes))
        main_prompt
    end
    def modify_contact
        id = take_id.to_i
        contact = @rolodex.find_contact(id)
        case select_attribute
        when 1
            puts "Please enter new first name. (Current Value: #{contact.first_name})"
            input = gets.chomp
            contact.first_name = input unless input.upcase == "NO"
        when 2
            puts "Please enter new last name. (Current Value: #{contact.last_name})"
            input = gets.chomp
            contact.last_name = input unless input.upcase == "NO"
        when 3
            puts "Please enter new E-Mail. (Current Value: #{contact.email})"
            input = gets.chomp
            contact.email = input unless input.upcase == "NO"
        when 4
            puts "Please enter new note. (Current Value: #{contact.notes})"
            input = gets.chomp
            contact.notes = input unless input.upcase == "NO"
        end
        main_prompt
    end
    def delete_contact
        id = take_id
        @rolodex.remove_contact(id)
        main_prompt
    end
    def display_all
        @rolodex.print_all
        main_prompt
    end
    def display_attribute
        id = take_id.to_i
        contact = @rolodex.find_contact(id)
        case select_attribute
        when 1
            puts "First Name: #{contact.first_name}"
        when 2
            puts "Last Name: #{contact.last_name}"
        when 3
            puts "E-Mail: #{contact.email}"
        when 4
            puts "Notes: #{contact.notes}"
        end
        main_prompt
    end
    def take_id
        puts "Please enter contact ID"
        request_id = gets.chomp
        puts "is #{request_id} correct? (Y/N)"
        case gets.chomp.upcase
        when "Y" then return request_id
        when "N" then main_prompt
        end
    end
    def select_attribute
        puts "Select an attribute"
        puts "[1] First Name"
        puts "[2] Last Name"
        puts "[3] E-Mail"
        puts "[4] Notes"
        puts "[5] Cancel"
        input = gets.chomp.to_i
        if input > 0 && input <= 5
            return input
        else
            puts "please try again."
            select_attribute
        end
    end
end
test = CRM.new
test.main_prompt
