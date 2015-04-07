require_relative 'contact'
class Rolodex
    def initialize
        @contacts = []
        @id = 1000
    end
    def has_contact_with_id?(id)
        @contacts.any?{|c| c.id == id.to_i}
    end
    def add_contact(fn, ln, em, notes)
        contact = Contact.new(fn, ln, em, notes, @id)
        @contacts << contact
        @id += 1
    end
    def find_contact(id)
        @contacts.find{|c| c.id == id.to_i}
    end
    def show_contact(id)
        puts "---------------------"
        puts find_contact(id)
        puts "---------------------"
    end
    def show_attribute(id, attribute)
        contact = find_contact(id)
        puts contact.read_attribute(attribute)
    end
    def modify(id, attribute, value)
        contact = find_contact(id)
        contact.write_attribute(attribute, value)
    end
    def remove_contact(id)
        @contacts.reject!{|c| c.id == id.to_i}
    end
    def print_all
        @contacts.each do |c|
            puts "---------------------"
            puts c
        end
        puts "---------------------"
    end
end
