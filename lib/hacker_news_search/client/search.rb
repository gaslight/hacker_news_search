module HackerNewsSearch
  class Client
    module Search
      
      # Returns the information based on the search criteria
      #
      # @param collection [String] collection is either -  users or items 
      # @param options [Hash] A customizable set of options. 
      # @return {Hash}
      # @see http://www.hnsearch.com/api
      # @see http://www.thriftdb.com/documentation/rest-api/search-api
      # @example
      #   HackerNewsSearch.search("users" "sferik")
      #   HackerNewsSearch.search("users", "sferik" {:limit => "30"})
      #   HackerNewsSearch.search("items" "jobs")
      def search(collection, query, options={})
        get("#{collection}/_search?q=#{query}", options)
      end
      
      # Returns the top 30 hot stories based on the Hacker News Search algorithm
      # 
      # @param options [Hash] A customizable set of options. 
      # @return {Hash}
      # @see http://www.hnsearch.com/api
      # @example
      #   HackerNewsSearch.hotness
      def hotness(options={})
        get("items/_search?limit=30&sortby=product(points,pow(2,div(div(ms(create_ts,NOW),3600000),72)))%20desc", options)
      end
    end
  end
end