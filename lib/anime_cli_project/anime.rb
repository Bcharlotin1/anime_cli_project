class Anime
    @@all =[] #class variable
    
    def initialize(anime_hash)
      anime_hash.each do |key, value|
        self.class.attr_accessor(key)
        self.send("#{key}=", value) 
      end
      save
    end
  
    
    def save
        if @@all.length > 0
            Anime.all.each do |instance|
               
                if instance.title != @title
                    @@all << self
                end
            end
        else
            @@all << self
        end
      
    end


    def self.all
      @@all
    end
end