

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
 data.each do |season, contestants_array|
    contestants_array.find do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end



def count_contestants_by_hometown(data, hometown)
  count = 0
    data.each do |season, contestants_array|
      contestants_array.each do |contestant|
        if contestant["hometown"] == hometown
          count = count + 1
        end
      end
    end
  return count
end

def get_occupation(data, hometown)
  data.each do |season, contestants_array|
    contestants_array.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end


def get_average_age_for_season(data, season)
  contestant_ages = data[season].collect do |contestant|
    contestant["age"].to_i
  end
  sum_of_ages = contestant_ages.reduce(0) {|sum, age| sum += age}
  contestant_count =  contestant_ages.count.to_f
  return (sum_of_ages/contestant_count).round
end
