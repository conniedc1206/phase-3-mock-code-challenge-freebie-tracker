# Deliverables use the notation # for instance methods, and . for class methods.

class Freebie < ActiveRecord::Base
    # Freebie#company: returns the Company instance for this Freebie (using belongs_to macro)
    # Freebie#dev: returns the Dev instance for this Freebie (using belongs_to macro)
    belongs_to :company
    belongs_to :dev

    # Freebie#print_details: should return a string formatted as follows: {insert dev's name} owns a {insert freebie's item_name} from {insert company's name} (instance method)
    # how to access each of these:
        # dev's name -> self.dev.name
        # freebie's item_name -> self.item_name
        # company's name -> self.company.name
        # self = the instance that this method is called on
    def print_details
        puts "#{dev.name} owns a #{item_name} from #{company.name}"
    end

end
