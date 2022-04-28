import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the library playlists of the user.
    ///
    /// You can add ``libraryPlaylists(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let playlists = MusicSense.libraryPlaylists()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Playlist` with related limit amount.
    static func libraryPlaylists(limit: Int? = nil) async throws -> MusicItemCollection<Playlist>{
         
        let libPlaylistsURL = AMEndpoint("library/playlists",limit: limit).url
        let libPlaylistsRequest = MusicDataRequest(urlRequest: URLRequest(url: libPlaylistsURL))
        let libPlaylistsResponse = try await libPlaylistsRequest.response()
        
        let decoder = JSONDecoder()
        let libPlaylists = try decoder.decode(MusicItemCollection<Playlist>.self, from: libPlaylistsResponse.data)
            
        return libPlaylists
           
    }


}
