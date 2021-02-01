class Cli
    
  
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

                    until input == "search" || input == "exit"
                    
                        puts
                        puts "If you would like more information on the anime please enter 'more info'."
                        puts
                        puts "If you would like to search up a new anime enter 'search'. "
                        puts
                        puts "To quit, type 'exit'."
                        puts
                        print "Enter: "
        
                        input = gets.strip

                        if input == "more info"
                            more_information(anime)

                            until input == "search" || input == "exit"
                                puts
                                puts "If you would like a list of recommended animes based off your search enter 'recommendations'"
                                puts
                                puts "If you would like to search up a new anime enter 'search'. "
                                puts
                                puts "To quit, type 'exit'."
                                puts
                                print "Enter: "
                                input = gets.strip
                                
                                if input == "recommendations" 
                                    recommendations(anime.id)
                                    puts
                                    puts "If you would like to search up a new anime enter 'search'. "
                                    puts
                                    puts "To quit, type 'exit'."
                                    puts
                                    print "Enter: "

                                    input = gets.strip
                                else
                                    until input == "search" || input == "back to recommendations" || input == "exit"
                                        puts " Invalide input. Please input 'back to recommendations' to go back for more information or 'search' if you want start a new search "
                                        puts
                                        puts "To quit, type 'exit'."
                                        puts
                                        print "Enter: "
                                        input = gets.strip
                                    end
                                end

                            end
                        else
                            until input == "search" || input == "back to more info" || input == "exit"
                                puts " Invalide input. Please input 'back to more info' to go back for more information or 'search' if you want start a new search "
                                puts
                                puts "To quit, type 'exit'."
                                puts
                                print "Enter: "
                                input = gets.strip
                            end

                        end
                    end
                else
                    until input == "search" || input == "exit"
                        puts
                        puts "Our database doses not have records for the anime you are searching for"
                        puts
                        puts "Please enter 'search' to search for a new anime"
                        puts
                        puts "To quit, type 'exit'."
                        print "Enter: "
                        input = gets.strip
                    end
                end
        
        end
    end

        
      
      def title_info(arg) #instance method
        puts
        puts "Title: #{arg.title}" #interpolation 
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