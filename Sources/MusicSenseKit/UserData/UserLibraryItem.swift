import Foundation
import MusicKit

/// A value type that can represent  different types of MusicItem retrieved from Apple Music API, contains Album, Playlist, Station
public enum UserLibraryItem {
    
    /// The MusicItem of Album
    case album(Album)
    
    /// The MusicItem of Playlist
    case playlist(Playlist)
    
    /// The MusicItem of Station
    case station(Station)
}

//conform to the MusicItem protocol
extension UserLibraryItem: MusicItem {
    
    /// Using switch-case to identify the different MusicItem data types and return their MusicItemID
    public var id: MusicItemID {
        let id: MusicItemID
        switch self {
            case .album(let album):
                id = album.id
            case .playlist(let playlist):
                id = playlist.id
            case .station(let station):
                id = station.id
        }
        return id
    }
}

//conform to the Decodable protocol.
extension UserLibraryItem: Decodable {
    
    /// A value used for request data decoding
    private enum CodingKeys: CodingKey {
        case type
    }
    
    /// Creates UserLibraryItem with specific MusicItem type
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let type = try values.decode(String.self, forKey: .type)
        switch type {
            case "albums", "library-albums":
                let album = try Album(from: decoder)
                self = .album(album)
            case "playlists", "library-playlists", "personal-recommendation":
                let playlist = try Playlist(from: decoder)
                self = .playlist(playlist)
            case "stations":
                let station = try Station(from: decoder)
                self = .station(station)
        default:
            let decodingErrorContext = DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "Unexpected type \"\(type)\"."
                            )
                            throw DecodingError.typeMismatch(UserLibraryItem.self, decodingErrorContext)
        }
    }
}

extension UserLibraryItem: CustomStringConvertible {
    
    /// A custom method to describe the UserLibraryItems
    public var description: String {
        let description: String
        switch self {
            case .album(let album):
                description = "UserLibraryItem.album(\(album))"
            case .playlist(let playlist):
                description = "UserLibraryItem.station(\(playlist))"
            case .station(let station):
            description = "UserLibraryItem.station(\(station))"
        }
        return description
    }
}
