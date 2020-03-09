
def are_in_the_same_home?(item1, val1, item2, val2)
  item1.index(val1) == item2.index(val2)
end

def is_left?(item1, val1, item2, val2)
  item1.index(val1) == item2.index(val2) - 1
end

def is_next_to?(item1, val1, item2, val2)
  (item1.index(val1) - item2.index(val2)).abs == 1
end
