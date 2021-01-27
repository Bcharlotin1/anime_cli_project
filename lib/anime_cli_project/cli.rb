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
                    end
                end
              
            end

            
            #   puts "To quit, type 'exit'."
            # case input 
            # when "title"
            #     title_info #if the put more info with out titile? 
            # when "more info"
            #         more_information 
            # end
    
            # if input == "title"
            #   title_info
            #   @status = input
            # end
    
            #   if input == "more info"
            #     more_information(@status)
            #   end
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

        # binding.pry
        # more = nil
        # Anime.all.each do |instance|
  
        #   if instance.title = arg
  
        #   more =instance.more_info
        #   end
  
        # end
  
    #   puts more
      end
        
  
end