class Cli
    attr_accessor :new_search
  
    def run
      puts "Welcome to the Anime library!"
      input = ""
      until input == "exit"
          puts
          puts "Please enter name of the Anime you would like information on"
          puts
          print "Enter Anime: " 
          input = gets.strip
  
          anime = Api.search_by_name(input)
         
         
            if anime
    
                title_info(anime)

                until input == "back" || input == "exit"
                
                    puts
                    puts "If you would like more information on the anime please enter 'more info'."
                    puts
                    puts "If you would like to search up a new anime enter 'back'. "
                    puts
                    puts "To quit, type 'exit'."
                    puts
                    print "Enter: "
    
                    input = gets.strip

                    if input == "more info"
                        more_information(anime)

                        until input == "back" || input == "exit"
                            puts
                            puts "If you would like a list of recommended animes based off your search enter 'recommendations'"
                            puts
                            puts "If you would like to search up a new anime enter 'back' twice. "
                            puts
                            puts "To quit, type 'exit'."
                            puts
                            print "Enter: "
                            input = gets.strip
                            
                            if input == "recommendations"
                                recommendations(anime.id)
                            end

                        end

                    end
                end
              
            end

        end
    end
        
      
       
        
      
  
      def title_info(arg)
        puts
        puts "Title: #{arg.title}" 
        puts
        puts "ID: #{arg.id}" 
        puts
        puts "Synopsis: #{arg.synopsis}"
        puts
      end
  
      def more_information(arg)
        puts
        puts "Type: #{arg.type}" 
        puts
        puts "Score: #{arg.score}"
        puts
        puts "TV Rating: #{arg.rated}"
        puts
        puts "Airing: #{arg.airing}" 
        puts
        puts "Start Date: #{arg.start_date}"
        puts
        puts "End Date: #{arg.end_date}"
        puts 
      end

      def recommendations(arg)
        puts
        puts Api.recos(arg)
        puts
      end
        
  
end