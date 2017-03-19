class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = Array.new
  end

  def self.count
    @@all.count
  end

  def species(species="human")
    @species = species
  end

  def say_species
    "I am a #{species}."
  end

  def name
    @name
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].map { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].map { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].map { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.map do |species, list|
      list.map { |pet| pet.mood = "nervous" }
      @pets[species] = []
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end
