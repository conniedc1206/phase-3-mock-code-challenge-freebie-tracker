# Deliverables use the notation # for instance methods, and . for class methods.

class Dev < ActiveRecord::Base
    # Dev#freebies: returns a collection of all the freebies that the Dev has collected
    # Dev#companies: returns a collection of all the companies that the Dev has collected freebies from
    has_many :freebies
    has_many :companies,  through: :freebies

    # Dev#received_one?(item_name): accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false (instance method)
    def received_one?(item_name)
        # find all freebies instances of this dev -> dev2 = Dev.second //<Dev:0x000055f723be6638 id: 2, name: "Morty">
        # get item_name(s) and turn it into an array -> freebies = dev2.freebies.pluck(:item_name) //["Keychain", "Keychain", "Phone Charger", "Job Offer", "umbrella"]
        freebies = self.freebies.pluck(:item_name)
        # see if item_name matches the item_name of those freebie instances: use #include? #include? will return true if the given element exists in the object. If it doesn't find a match, it will return false -> freebies.include?(item_name)
        freebies.include?(item_name)
    end
    
    # Dev#give_away(dev, freebie): accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
    def give_away(dev, freebie)
        # check if freebie belongs to self?
            # get all the freebie instances for this dev -> self.freebies.include?(freebie)
            # check if freebie(from argument) is included -> if return true, then proceed to next step. If false, then stop?
        if self.freebies.include?(freebie) == true 
            # changes the freebie's dev to dev in argument: use update
            # freebie.update(dev: dev) -> updates that specific instance
            freebie.update(dev: dev)
        end
    end
end
