# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Locate the file that needs to be linked ie. data for this class

require_relative 'state_data'

class VirusPredictor

  # Initializing instance variables to be used throughout the class
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Method that runs the other methods
  def virus_effects  
    predicted_deaths
    speed_of_spread
  end

  private

  # Calculates number of deaths based on population density
  def predicted_deaths
    # predicted deaths is solely based on population density
    case @population_density
    when  200..Float::INFINITY then percentage = 0.4
    when 150..199 then percentage = 0.3
    when 100..149 then percentage = 0.2
    when 50..99 then percentage = 0.1
    else percentage = 0.05
    end

    number_of_deaths = (@population * percentage).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Determines the speed of the virus spreading based on the population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    case @population_density
    when 200..Float::INFINITY
      speed = 0.5
    when 150..199
      speed = 1
    when 100..149
      speed = 1.5
    when 50..99
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do  |state, population_facts|
  new_state = VirusPredictor.new(state, population_facts[:population_density], population_facts[:population])
  new_state.virus_effects
end


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section