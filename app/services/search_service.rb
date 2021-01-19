class SearchService
  include HTTParty

  def initilize
  end

  def fetch(search)
    base_uri = 'https://api.unsplash.com/search/photos?page=3&query='+search

    pp base_uri

    response = HTTParty.get(
                          base_uri,
                          headers: {"Authorization" => 'Client-ID zeDDL_ZNA4C-pxRQgi3cOCXrJGVeLXdC9Id4lSUWob4'}
                        )
  end
end
