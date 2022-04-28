import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the recently played tracks of the user.
    ///     
    /// You can add ``recentTracks(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let tracks = MusicSense.recentTracks()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Track` with related limit amount.
    static func recentTracks(limit: Int? = nil) async throws -> MusicItemCollection<Track> {

        let recentTracksURL = AMEndpoint("recent/played/tracks",limit: limit).url
        let recentTracksRequest = MusicDataRequest(urlRequest: URLRequest(url: recentTracksURL))
        let recentTracksResponse = try await recentTracksRequest.response()
                    
        let decoder = JSONDecoder()
        let recentTracks = try decoder.decode(MusicItemCollection<Track>.self, from: recentTracksResponse.data)
                
        return recentTracks
 
    }
}
