class Anime
    @@all =[] 

    
    def initialize(anime_hash)
      anime_hash.each do |key, value|
        self.class.attr_accessor(key)
        self.send("#{key}=", value) 
      end
      save
    end
  
    # def self.find_or_create(anime_hash)
    #     if @@all.length > 0
    #         Anime.all.each do |instance|
    #             if instance.title == anime_hash["title"]
    #                 instance
    #             end

    #         end
    #     else
    #         Anime.new(anime_hash)
    #     end
    # end
    
    def save
        if @@all.length > 0

            x = Anime.all.find {|instance| instance.title == @title}
                if x 
                    x
                else
                    @@all << self
                end
                binding.pry
        else
            @@all << self
        end
    
    end

    def self.all
      @@all
    end
end