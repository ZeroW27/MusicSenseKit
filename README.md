# MusicSenseKit

An iOS framework that provides Music Sensing functionality to your applications. Currently support music data from Apple Music.

## Supported Sensors

The following music item types are currently supported in MusicSenseKit:

- Album
- Track
- Playlist
- Artist

These three music data type can cover most of the usage scenarios of music service.

The following user music data are currently supported in MusicSenseKit:

- Library Albums
- Library Playlists
- Library Artists
- Recently Added Resources
    - Recently Added Albums
    - Recently Added Playlists
- Recently Played Resources
    - Recently Played Albums
    - Recently Played Playlists
- Recently Tracks


## Installing the Framework

You can easily install MusicSenseKit Framework by adding a SwiftPM to your Xcode iOS project. 

## Using the Library

Import and init MusicSenseKit as shown below:

*Swift*

```swift
import MusicSenseKit

let libraryAlbums = try await MusicSenseKit.libraryAlbums()

let recentTracks = try await MusicSenseKit.libraryTracks()

```

## Configure the framework with an iOS App
This framework must be run on a physical device (i.e., an iPhone).

Before you run the project in Xcode, perform the following steps:

1. In the Project navigator, select the project and click the *Signing & Capabilities* tab.
2. Select your developer team from the *Team* menu.
3. Choose a new bundle identifier for the `Your App` target, and enter it in the Bundle Identifier field. The bundle identifier within the project has an associated App ID, so you need a unique identifier to create your own App ID. Use a reverse-DNS format for your identifier, as [Preparing Your App For Distribution](https://developer.apple.com/documentation/xcode/preparing-your-app-for-distribution) describes.
4. In Safari, visit the [Certificates, Identifiers, and Profiles](https://developer.apple.com/account/resources) section of the developer web site.
5. Select *Identifiers* and click the Add button to create a new App ID for `Your App`. Follow the steps until you reach the *Register an App ID* page.
6. For the Bundle ID, select *Explicit*, and enter the bundle identifier from step 2.
7. Click the *App Services* tab, and select the MusicKit checkbox.
8. Complete the App ID creation process.

After creating your App ID, your Xcode project needs no additional configuration. The App Service is a run-time service that automatically associates with app's bundle ID.

## Required Info.plist Keys

Depending on the used sensor and its configuration, some keys with a user-friendly description should be included in the [info.plist application file](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html):

### Music
Privacy - Media Library Usage Description: NSAppleMusicUsageDescription

---

Thanks for [Apple Developer Forum](https://developer.apple.com/forums/tags/musickit) and related materials on WWDC that have so many useful information helped me to build this.


For future features, I want to add more data types. Or make it compatible with Spotify.
