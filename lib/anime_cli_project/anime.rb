class Anime
    @@all =[] 

    
    def initialize(anime_hash)
      anime_hash.each do |key, value|
        self.class.attr_accessor(key)
        self.send("#{key}=", value) 
      end
      find_or_create
    end
    
    def find_or_create

        if @@all.length > 0

            anime_instance = Anime.all.find {|instance| instance.title == @title}
                if anime_instance  
                    anime_instance 
                else
                    save
                end
        else
           save
        end
    end
    
    def save
     @@all << self
     binding.pry
    end

    def self.all
      @@all
    end
end