import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the library albums of the user.
    ///
    /// You can add ``libraryAlbums(limit:)`` to your app easily as a MusicItemCollection<Album>, by calling:
    ///
    /// ```swift
    /// let albums = MusicSense.libraryAlbums()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Album` with related limit amount.
    static func libraryAlbums(limit: Int? = nil) async throws -> MusicItemCollection<Album>{
        
        let libAlbumsURL = AMEndpoint("library/albums",limit: limit).url
        let libAlbumsRequest = MusicDataRequest(urlRequest: URLRequest(url: libAlbumsURL))
        let libAlbumsResponse = try await libAlbumsRequest.response()
        
        let decoder = JSONDecoder()
        let libAlbums = try decoder.decode(MusicItemCollection<Album>.self, from: libAlbumsResponse.data)
    
        return libAlbums
                  
    }

}
