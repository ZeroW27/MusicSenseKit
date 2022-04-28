import Foundation
import MusicKit

/// An object containing results for `RecentRequest`.
/// It can also filter the different `MusicItem` data types, return them to the app.
public struct RecentResponse: Decodable {
    
    /// A `MusicItemCollection` for user's recent MusicItems from `RecentRequest`
    public let musicItems: MusicItemCollection<UserLibraryItem>

    /// A `MusicItemCollection` of recent albums.
    public var albums: MusicItemCollection<Album> {
        
        MusicItemCollection(musicItems.compactMap { musicItem in
            if case let .album(album) = musicItem {
                return album
            } else {
                return nil
            }
        })
        
    }

    /// A `MusicItemCollection` of recent playlists.
    public var playlists: MusicItemCollection<Playlist> {
        
        MusicItemCollection(musicItems.compactMap { musicItem in
            if case let .playlist(playlist) = musicItem {
                return playlist
            } else {
                return nil
            }
        })
        
    }

    /// A `MusicItemCollection` of recent stations.
    public var stations: MusicItemCollection<Station> {
        
        MusicItemCollection(musicItems.compactMap { musicItem in
            if case let .station(station) = musicItem {
                return station
            } else {
                return nil
            }
        })
        
    }
}
