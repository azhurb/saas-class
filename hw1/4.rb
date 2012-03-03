class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name, :calories

  def healthy?
    calories<200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    @flavor != "black licorice"
  end
end