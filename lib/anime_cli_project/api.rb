class Api
    def self.search_by_name(input)
      anime_name = input.gsub(" ", "_")
      data = HTTParty.get("https://api.jikan.moe/v3/search/anime?q=#{anime_name}")
      anime = nil
 
      data["results"].each do |result|
    
        if result["title"] == input.split.map(&:capitalize).join(' ')
         
          anime_hash = {
            title: result["title"],
            id: result["mal_id"],
            synopsis: result["synopsis"], 
            type: result["type"], 
            score: result["score"], 
            airing: result["airing"], 
            rated: result["rated"], 
            start_date: result["start_date"], 
            end_date: result["end_date"] 
  
            }
            anime = Anime.new(anime_hash)
         
        end
          
      end 
      anime
    end
  
    def self.recos(input) 
        id = input.to_i
        
        data = HTTParty.get("https://api.jikan.moe/v3/anime/#{id}/recommendations")
    
        anime_recomedation = []

        data["recommendations"].each do |result|
            
            anime_recomedation << result["title"]
        end

      anime_recomedation

    end
end

  