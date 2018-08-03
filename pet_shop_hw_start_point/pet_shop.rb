def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_sum)
  pet_shop[:admin][:total_cash] = total_cash(pet_shop) + cash_sum
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_pets_sold)
  pet_shop[:admin][:pets_sold] = pets_sold(pet_shop) + num_pets_sold
end

def stock_count(pet_shop)
  pet_count = 0
  for pet in pet_shop[:pets]
    pet_count += 1
  end
  return pet_count
end

def pets_by_breed(pet_shop, breed_name)
  pets_by_breed = []
  for pet in pet_shop[:pets]
    if breed_name == pet[:breed]
      pets_by_breed.push(pet)
    end
  end
  return pets_by_breed
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet_name == pet[:name]
      pet_found = pet
    end
  end
  return pet_found
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, pet_name))
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash_paid)
  customer[:cash] = customer_cash(customer) - cash_paid
end

def customer_pet_count(customer)
  pet_count = 0
  for pet in customer[:pets]
    pet_count += 1
  end
  return pet_count
end

def add_pet_to_customer(customer, sold_pet)
  customer[:pets].push(sold_pet)
end

def customer_can_afford_pet(customer, sold_pet)
  if customer[:cash] < sold_pet[:price]
    return false
  end
  return true
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
      pet_price = pet[:price]
      add_or_remove_cash(pet_shop, pet_price)
      increase_pets_sold(pet_shop, 1)
      remove_pet_by_name(pet_shop, pet[:name])
      add_pet_to_customer(customer, pet)
      remove_customer_cash(customer, pet_price)
  end
end
