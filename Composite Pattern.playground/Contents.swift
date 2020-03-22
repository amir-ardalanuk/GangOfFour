import UIKit

protocol IComponent {
    func getName()->String
    func play()
    mutating func playbackSpeed(speed:Float)
}

struct Song:IComponent {
  
    
    
    var artist:String!
    var name : String!
    var speed:Float = 1
    
    init(name : String,artist:String) {
        self.name = name
        self.artist = artist
    }
    func getName() -> String {
        return name
    }
    
    func play() {
        print("PLAY Song")
    }
    
    mutating func playbackSpeed(speed: Float) {
        self.speed = speed
    }
    
    
}


struct Playlist : IComponent {
    
    var playlist : [IComponent] = []
    var name : String!
    
    init(name : String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func play() {
        print("Play PlayList    ")
    }
    
    func playbackSpeed(speed: Float) {
        for var i in self.playlist {
            i.playbackSpeed(speed: speed)
        }
    }
    
    mutating func add(song : IComponent){
        self.playlist.append(song)
    }
    
    mutating func remove(song : IComponent){
        let  index = self.playlist.index{ $0.getName() == song.getName() }
        guard let safeIndex = index else {
            return
        }
        self.playlist.remove(at: safeIndex)
    }
    
}
var playList = Playlist(name: "2020")
let ladyGaga = Song(name: "when start is come", artist: "LAdyGaga")
let katyPerry = Song(name: "Pary Night", artist: "Kary Perry")

playList.add(song: ladyGaga)
playList.add(song: katyPerry)


