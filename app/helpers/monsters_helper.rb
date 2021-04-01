module MonstersHelper

    def display_percentage(monster)
        string_percentage = sprintf('%.3f', monster.win_percentage.round(3)) 
        string_percentage.slice!(0) if string_percentage[0] == "0" 
        string_percentage
    end

end
