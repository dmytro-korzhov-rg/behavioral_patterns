# frozen_string_literal: true

class Beverage
  def prepare
    boil_water
    brew
    pour_in_cup
    add_condiments
  end

  def boil_water
    puts 'Boiling water...'
  end

  def pour_in_cup
    puts 'Pouring into cup...'
  end
end
