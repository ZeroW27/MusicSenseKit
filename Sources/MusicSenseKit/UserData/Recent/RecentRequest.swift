import Foundation
import MusicKit

@available(iOS 15.4, *)
public extension MusicSense{
    
    /// Request the recently played `MusicItemCollection` of the user.
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `UserLibraryItem` with related limit amount.
    static func recentPlayedItems(limit: Int? = nil) async throws -> MusicItemCollection<UserLibraryItem> {
        let request = RecentRequest("recent/played", limit: limit)
        let response = try await request.response()
        return response.musicItems
    }
    
    /// Request the recently played `MusicItemCollection` of the user.
    ///
    /// You can add ``recentPlayedAlbums(limit:)`` to your app easily as a MusicItemCollection<Album>, by calling:
    ///
    /// ```swift
    /// let albums = MusicSense.recentPlayedAlbums()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Album` with related limit amount.
    static func recentPlayedAlbums() async throws -> MusicItemCollection<Album> {
        let request = RecentRequest("recent/played")
        let response = try await request.response()
        return response.albums
    }
    
    /// Request the recently played `MusicItemCollection` of the user.
    ///
    /// You can add ``recentPlayedPlaylists(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let playlists = MusicSense.recentPlayedPlaylists()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Playlist` with related limit amount.
    static func recentPlayedPlaylists() async throws -> MusicItemCollection<Playlist> {
        let request = RecentRequest("recent/played")
        let response = try await request.response()
        return response.playlists
    }
    
    /// Request the recently added `MusicItemCollection` of the user.
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `UserLibraryItem` with related limit amount.
    static func addedItems(limit: Int? = nil) async throws -> MusicItemCollection<UserLibraryItem> {
        let request = RecentRequest("library/recently-added", limit: limit)
        let response = try await request.response()
        return response.musicItems
    }
    
    /// Request the recently added `MusicItemCollection` of the user.
    ///
    /// You can add ``addedAlbums(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let albums = MusicSense.addedAlbums()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Album` with related limit amount.
    static func addedAlbums() async throws -> MusicItemCollection<Album> {
        let request = RecentRequest("library/recently-added")
        let response = try await request.response()
        return response.albums
    }
    
    /// Request the recently added `MusicItemCollection` of the user.
    ///
    /// You can add ``addedPlaylists(limit:)`` to your app easily as a MusicItemCollection, by calling:
    ///
    /// ```swift
    /// let playlists = MusicSense.addedPlaylists()
    /// ```
    ///
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Playlist` with related limit amount.
    static func addedPlaylists() async throws -> MusicItemCollection<Playlist> {
        let request = RecentRequest("library/recently-added")
        let response = try await request.response()
        return response.playlists
    }
    
    /// Request the recently played `MusicItemCollection` of the user.
    /// - Parameter limit: The amount of items requested.
    /// - Returns: MusicItemCollection of `Playlist` with related limit amount.
    static func recommendPlaylists() async throws -> MusicItemCollection<Playlist> {
        let request = RecentRequest("recommendations")
        let response = try await request.response()
        return response.playlists
    }
    
}

/// A request for loading data from user's recent music items with Apple Music API endpoint.
public struct RecentRequest {
    
    /// The limit count for the number of items returned with API
    public var limit: Int?

    /// The endpoint path to fetch user's recent MusicItems
    public var path: String

    /// Creates a music data request with path and limit amount
    ///
    ///  - Parameters:
    ///     - path: The endpoint path to fetch user's recent MusicItems
    ///     - limit: The limit count for the number of items returned with API
    public init(_ path: String, limit: Int? = nil) {
        self.path = path
        self.limit = limit
    }

    /// Request user's recently MusicItems with relevent endpoint
    public func response() async throws -> RecentResponse {
        let url = AMEndpoint(path,limit: limit).url
        let request = MusicDataRequest(urlRequest: URLRequest(url: url))
        let response = try await request.response()
        let musicItems = try JSONDecoder().decode(MusicItemCollection<UserLibraryItem>.self, from: response.data)
        return RecentResponse(musicItems: musicItems)
    }
}
