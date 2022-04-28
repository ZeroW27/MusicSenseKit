import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the library tracks of the user.
    ///
    /// You can add ``libraryTracks(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let tracks = MusicSense.libraryTracks()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Track` with related limit amount.
    static func libraryTracks(limit: Int? = nil) async throws -> MusicItemCollection<Track>{
        
        let libTracksURL = AMEndpoint("library/tracks",limit: limit).url
        let libTracksRequest = MusicDataRequest(urlRequest: URLRequest(url: libTracksURL))
        let libTracksResponse = try await libTracksRequest.response()
        
        let decoder = JSONDecoder()
        let libTracks = try decoder.decode(MusicItemCollection<Track>.self, from: libTracksResponse.data)
    
        return libTracks
                  
    }

}
