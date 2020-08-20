import UIKit

class SettingsTheme {
    
    static var light: SettingsTheme {
        return SettingsTheme(darkSide: false)
    }
    
    static var dark: SettingsTheme {
        return SettingsTheme(darkSide: true)
    }

    let backgroundColor: UIColor
    let separatorColor: UIColor
    let topImage: UIImage
    
    let cellTitleColor: UIColor
    let cellSubtitleColor: UIColor
    let primaryColor: UIColor
    let radioActiveImage: UIImage
    let radioInactiveImage: UIImage
    
    let username: String
    
    init(darkSide: Bool) {
        if darkSide {
            username = "Darth Vader"
            backgroundColor = UIColor(string: "#141217")
            separatorColor = UIColor(string: "#1f1d22")
            topImage = Bundle.StarWars_image(named: "Photo_dark")!
            cellTitleColor = UIColor(string: "#4f4d51")
            cellSubtitleColor = UIColor(string: "#d0d0d1")
            primaryColor = UIColor(string: "#ef5350")
            radioActiveImage = Bundle.StarWars_image(named: "Radio-dark_Active")!
            radioInactiveImage = Bundle.StarWars_image(named: "Radio-dark_Inactive")!
        } else {
            username = "Anakin Skywalker"
            backgroundColor = UIColor(string: "#f8f8f8")
            separatorColor = UIColor(string: "#ededed")
            topImage = Bundle.StarWars_image(named: "Photo_light")!
            cellTitleColor = UIColor(string: "#8e8e8e")
            cellSubtitleColor = UIColor(string: "#55606f")
            primaryColor = UIColor(string: "#0288d1")
            radioActiveImage = Bundle.StarWars_image(named: "Radio-light_Active")!
            radioInactiveImage = Bundle.StarWars_image(named: "Radio-light_Inactive")!
        }
    }
}
