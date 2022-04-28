import Foundation
import MusicKit

///Apple Music API endpoint URL
public struct AMEndpoint {
    
    /// The endpoint path to fetch user's  MusicItems
    public var path: String
    
    /// The limit count for the number of items returned with API
    public var limit: Int?

    /// Creates a music data request with path and limit amount
    ///
    ///  - Parameters:
    ///     - path: The endpoint path to fetch user's  MusicItems
    ///     - limit: The limit count for the number of items returned with API
    public init(_ path: String, limit: Int? = nil) {
        self.path = path
        self.limit = limit
    }
}

extension AMEndpoint {
    
    /// The URL to request for Apple Music API
    public var url: URL {
       
        var urlComponents = URLComponents()
        var queryItems: [URLQueryItem]?

        urlComponents.scheme = "https"
        urlComponents.host = "api.music.apple.com"
        urlComponents.path = "/v1/me/" + path
        
        if let limit = limit {
            queryItems = [.init(name: "limit", value: "\(limit)")]
        }
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            preconditionFailure("URL error: \(urlComponents)")
        }
                    
        return url
        
    }
    
}


