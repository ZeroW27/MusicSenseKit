import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the library artists of the user.
    ///
    /// You can add ``libraryArtists(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let artists = MusicSense.libraryArtists()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Artist` with related limit amount.
    static func libraryArtists(limit: Int? = nil) async throws -> MusicItemCollection<Artist>{
        
        let libArtistsURL = AMEndpoint("library/artists",limit: limit).url
        let libArtistsRequest = MusicDataRequest(urlRequest: URLRequest(url: libArtistsURL))
        let libArtistsResponse = try await libArtistsRequest.response()
        
        let decoder = JSONDecoder()
        let libArtists = try decoder.decode(MusicItemCollection<Artist>.self, from: libArtistsResponse.data)
    
        return libArtists
                  
    }

}
