class Company < ActiveRecord::Base
    # Company#freebies: returns a collection of all the freebies for the Company
    # Company#devs: returns a collection of all the devs who collected freebies from the Company
    has_many :freebies
    has_many :devs,  through: :freebies

    # Company#give_freebie(dev, item_name, value): takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev (instance method)
    def give_freebie(dev, item_name, value)
        # find the dev using dev from argument
        dev = Dev.find_by(name: dev)
        # use Freebie.create to create new freebie instance
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end

    # Company.oldest_company: returns the Company instance with the earliest founding year (class method)
    def self.oldest_company
        # turn all the company's years into an array
        years = all.pluck(:founding_year)
        # return the smallest value of an array is to use the Spread Operator on Math.min() function
        min_year = years.min()
        # find the matching Company instance to that year
        self.find_by(founding_year: min_year)
    end
end
