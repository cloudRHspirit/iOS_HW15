//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Roman Hural on 20.02.2022.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var sampleEmojis: [Emoji] {
        return [
        Emoji(symbol: "π", name: "Grinning Face", description: "A typical smiley face", usage: "happiness"),
        Emoji(symbol: "π", name: "Confused Face", description: "A confused, puzzled face", usage: "displeasure"),
        Emoji(symbol: "π", name: "Heart Eyes", description: "A smiley face with hearts for eyes", usage: "attractive"),
        Emoji(symbol: "π¨βπ»", name: "Developer", description: "A person working on Mackbook", usage: "programming"),
        Emoji(symbol: "π’", name: "Turtle", description: "A cute turtle", usage: "something slow"),
        Emoji(symbol: "π", name: "Elephant", description: "A gray elephant", usage: "good memory"),
        Emoji(symbol: "π", name: "Spaghetti", description: "A plate of spaghetti", usage: "spaghetti"),
        Emoji(symbol: "π²", name: "Die", description: "Single die", usage: "taking a risk"),
        Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent", usage: "camping"),
        Emoji(symbol: "π", name: "Stack of Books", description: "Three colored books stacked on each other", usage: "studying"),
        Emoji(symbol: "π", name: "Broken Heart", description: "A red, broken heart", usage: "extreme sadness"),
        Emoji(symbol: "π", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion"),
        Emoji(symbol: "β", name: "Check mark", description: "While you have completed something", usage: "completion"),
        Emoji(symbol: "β½οΈ", name: "Soccer ball", description: "A ball for playing in soccer", usage: "soccer"),
        Emoji(symbol: "πΏ", name: "Popcorn", description: "Tasty popcorn", usage: "watching a movie"),
        Emoji(symbol: "π", name: "Apple", description: "A red apple", usage: "lunch"),
        Emoji(symbol: "π", name: "Sun", description: "A yellow sun with eyes", usage: "good weather"),
        Emoji(symbol: "β‘οΈ", name: "Lighthing", description: "Scary lightning", usage: "bad weather")
        ]
    }
    
    static var archiveURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("Documents").appendingPathExtension("plist")
        return archiveURL
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmojis = try? propertyListEncoder.encode(emojis)
        try? encodedEmojis?.write(to: Emoji.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji]? {
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrivedEmojisData = try? Data(contentsOf: archiveURL),
            let decodedEmojis = try? propertyListDecoder.decode([Emoji].self, from: retrivedEmojisData) {
            return decodedEmojis
        } else {
            return nil
        }
    }
}
