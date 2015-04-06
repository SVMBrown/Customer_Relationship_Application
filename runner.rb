class Runner
    def initialize
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
    end
    def modify_contact
        puts "modify called."
    end
    def delete_contact
        puts "delete called."
    end
    def display_all
        puts "display all called."
    end
    def display_attribute
        puts "display_attribute called."
    end
end
test = Runner.new
test.main_prompt
