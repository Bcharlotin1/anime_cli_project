class Anime
    @@all =[] 

    
    def initialize(anime_hash)
      anime_hash.each do |key, value|
        self.class.attr_accessor(key)
        self.send("#{key}=", value) 
      end
      save
    end
  
    
    def save
        if @@all.length > 0

            x = Anime.all.find {|instance| instance.title == @title}
                if x 
                    x
                else
                    @@all << self
                end
        else
            @@all << self
        end
    
    end

    def self.all
      @@all
    end
end