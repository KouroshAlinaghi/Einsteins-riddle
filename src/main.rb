require 'terminal-table'
require_relative 'methods'

def solve

  color        = ["blue", "green", "red", "white", "yellow"].permutation
  nationallity = ["brit", "dane", "german", "norwegian", "swede"].permutation.select {|n| n.first == "norwegian"}
  drink        = ["beer", "coffee", "milk", "tea", "water"].permutation.select {|d| d[2] == "milk"}
  cigar        = ["blue master", "dunhill", "pall mall", "prince", "blend"].permutation
  pet          = ["cat", "bird", "dog", "fish", "horse"].permutation

  color.each do |colors|
    next unless is_left?(colors, "green", colors, "white") 
    nationallity.each do |nationalities|
      next unless are_in_the_same_home?(nationalities, "brit", colors, "red") 
      next unless is_next_to?(nationalities, "norwegian", colors, "blue") 
      drink.each do |drinks|
        next unless are_in_the_same_home?(colors, "green", drinks, "coffee") 
        next unless are_in_the_same_home?(nationalities, "dane", drinks, "tea") 
          pet.each do |pets|
            next unless are_in_the_same_home?(nationalities, "swede", pets, "dog") 
            cigar.each do |cigars|
              next unless are_in_the_same_home?(cigars, "dunhill", colors, "yellow")
              next unless are_in_the_same_home?(cigars, "pall mall", pets, "bird") 
              next unless are_in_the_same_home?(cigars, "prince", nationalities, "german")
              next unless are_in_the_same_home?(cigars, "blue master", drinks, "beer") 
              next unless is_next_to?(cigars, "blend", pets, "cat") 
              next unless is_next_to?(pets, "horse", cigars, "dunhill") 
              next unless is_next_to?(cigars, "blend", drinks, "water")
              table = Terminal::Table.new do |t|
                t.add_row ["Color:"] + colors
                t.add_row ["Nationality:"] + nationalities
                t.add_row ["Pet:"] + pets
                t.add_row ["Drink:"] + drinks
                t.add_row ["Cigar:"] + cigars
                t.style = {:all_separators => true}
              end
              puts table
              break
            end
          end
      end
    end
  end

end
start = Time.now
solve()
finish = Time.now
puts "Time: #{finish - start}sec"

