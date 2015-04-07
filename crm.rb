require_relative 'rolodex'
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
        @rolodex.add_contact(first_name, last_name, email, notes)
        main_prompt
    end
    def modify_contact
        id = take_id
        if @rolodex.has_contact_with_id?(id)
            @rolodex.show_contact(id)
            attribute = select_attribute
            puts "What would you like the new value to be?"
            @rolodex.modify(id, attribute, gets.chomp)
        else
            puts "no contact at #{id}"
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
        id = take_id
        if @rolodex.has_contact_with_id?(id)
            @rolodex.show_attribute(id, select_attribute)
        else
            puts "Contact not found"
        end
        main_prompt
    end
    def take_id
        puts "Please enter contact ID"
        request_id = gets.chomp.to_i
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
