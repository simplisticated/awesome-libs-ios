//
//  ColorManagerExtensionName.swift
//  Pixels
//
//  Created by Igor Matyushkin on 23.11.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension ColorManager {
    
    public struct HTMLNameSearchResult {
        public var name: String
        public var accuracy: Double
    }
    
    public var closestHTMLName: HTMLNameSearchResult? {
        get {
            struct ColorName {
                var rgba: RGBAColor
                var name: String
            }
            
            let colorNames: [ColorName] = [
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.aliceBlue),
                    name: "Alice Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.antiqueWhite),
                    name: "Antique White"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.aqua),
                    name: "Aqua"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.aquamarine),
                    name: "Aquamarine"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.azure),
                    name: "Azure"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.beige),
                    name: "Beige"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.bisque),
                    name: "Bisque"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.black),
                    name: "Black"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.blanchedAlmond),
                    name: "Blanched Almond"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.blue),
                    name: "Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.blueViolet),
                    name: "Blue Violet"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.brown),
                    name: "Brown"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.burlyWood),
                    name: "Burly Wood"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.cadetBlue),
                    name: "Cadet Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.chartreuse),
                    name: "Chartreuse"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.chocolate),
                    name: "Chocolate"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.coral),
                    name: "Coral"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.cornflowerBlue),
                    name: "Cornflower Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.cornsilk),
                    name: "Cornsilk"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.crimson),
                    name: "Crimson"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.cyan),
                    name: "Cyan"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkBlue),
                    name: "Dark Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkCyan),
                    name: "Dark Cyan"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkGoldenRod),
                    name: "Dark Golden Rod"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkGray),
                    name: "Dark Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkGrey),
                    name: "Dark Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkGreen),
                    name: "Dark Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkKhaki),
                    name: "Dark Khaki"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkMagenta),
                    name: "Dark Magenta"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkOliveGreen),
                    name: "Dark Olive Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkOrange),
                    name: "Dark Orange"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkOrchid),
                    name: "Dark Orchid"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkRed),
                    name: "Dark Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkSalmon),
                    name: "Dark Salmon"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkSeaGreen),
                    name: "Dark Sea Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkSlateBlue),
                    name: "Dark Slate Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkSlateGray),
                    name: "Dark Slate Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkSlateGrey),
                    name: "Dark Slate Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkTurquoise),
                    name: "Dark Turquoise"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.darkViolet),
                    name: "Dark Violet"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.deepPink),
                    name: "Deep Pink"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.deepSkyBlue),
                    name: "Deep Sky Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.dimGray),
                    name: "Dim Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.dimGrey),
                    name: "Dim Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.dodgerBlue),
                    name: "Dodger Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.fireBrick),
                    name: "Fire Brick"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.floralWhite),
                    name: "Floral White"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.forestGreen),
                    name: "Forest Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.fuchsia),
                    name: "Fuchsia"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.gainsboro),
                    name: "Gainsboro"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.ghostWhite),
                    name: "Ghost White"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.gold),
                    name: "Gold"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.goldenRod),
                    name: "Golden Rod"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.gray),
                    name: "Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.grey),
                    name: "Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.green),
                    name: "Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.greenYellow),
                    name: "Green Yellow"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.honeyDew),
                    name: "Honey Dew"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.hotPink),
                    name: "Hot Pink"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.indianRed),
                    name: "Indian Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.indigo),
                    name: "Indigo"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.ivory),
                    name: "Ivory"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.khaki),
                    name: "Khaki"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lavender),
                    name: "Lavender"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lavenderBlush),
                    name: "Lavender Blush"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lawnGreen),
                    name: "Lawn Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lemonChiffon),
                    name: "Lemon Chiffon"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightBlue),
                    name: "Light Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightCoral),
                    name: "Light Coral"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightCyan),
                    name: "Light Cyan"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightGoldenRodYellow),
                    name: "Light Golden Rod Yellow"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightGray),
                    name: "Light Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightGrey),
                    name: "Light Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightGreen),
                    name: "Light Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightPink),
                    name: "Light Pink"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSalmon),
                    name: "Light Salmon"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSeaGreen),
                    name: "Light Sea Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSkyBlue),
                    name: "Light Sky Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSlateGray),
                    name: "Light Slate Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSlateGrey),
                    name: "Light Slate Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightSteelBlue),
                    name: "Light Steel Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lightYellow),
                    name: "Light Yellow"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.lime),
                    name: "Lime"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.limeGreen),
                    name: "Lime Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.linen),
                    name: "Linen"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.magenta),
                    name: "Magenta"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.maroon),
                    name: "Maroon"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumAquaMarine),
                    name: "Medium Aqua Marine"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumBlue),
                    name: "Medium Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumOrchid),
                    name: "Medium Orchid"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumPurple),
                    name: "Medium Purple"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumSeaGreen),
                    name: "Medium Sea Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumSlateBlue),
                    name: "Medium Slate Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumSpringGreen),
                    name: "Medium Spring Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumTurquoise),
                    name: "Medium Turquoise"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mediumVioletRed),
                    name: "Medium Violet Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.midnightBlue),
                    name: "Midnight Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mintCream),
                    name: "Mint Cream"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.mistyRose),
                    name: "Misty Rose"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.moccasin),
                    name: "Moccasin"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.navajoWhite),
                    name: "Navajo White"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.navy),
                    name: "Navy"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.oldLace),
                    name: "Old Lace"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.olive),
                    name: "Olive"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.oliveDrab),
                    name: "Olive Drab"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.orange),
                    name: "Orange"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.orangeRed),
                    name: "Orange Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.orchid),
                    name: "Orchid"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.paleGoldenRod),
                    name: "Pale Golden Rod"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.paleGreen),
                    name: "Pale Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.paleTurquoise),
                    name: "Pale Turquoise"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.paleVioletRed),
                    name: "Pale Violet Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.papayaWhip),
                    name: "Papaya Whip"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.peachPuff),
                    name: "Peach Puff"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.peru),
                    name: "Peru"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.pink),
                    name: "Pink"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.plum),
                    name: "Plum"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.powderBlue),
                    name: "Powder Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.purple),
                    name: "Purple"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.rebeccaPurple),
                    name: "Rebecca Purple"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.red),
                    name: "Red"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.rosyBrown),
                    name: "Rosy Brown"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.royalBlue),
                    name: "Royal Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.saddleBrown),
                    name: "Saddle Brown"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.salmon),
                    name: "Salmon"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.sandyBrown),
                    name: "Sandy Brown"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.seaGreen),
                    name: "Sea Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.seaShell),
                    name: "Sea Shell"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.sienna),
                    name: "Sienna"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.silver),
                    name: "Silver"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.skyBlue),
                    name: "Sky Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.slateBlue),
                    name: "Slate Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.slateGray),
                    name: "Slate Gray"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.slateGrey),
                    name: "Slate Grey"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.snow),
                    name: "Snow"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.springGreen),
                    name: "Spring Green"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.steelBlue),
                    name: "Steel Blue"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.tan),
                    name: "Tan"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.teal),
                    name: "Teal"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.thistle),
                    name: "Thistle"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.tomato),
                    name: "Tomato"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.turquoise),
                    name: "Turquoise"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.violet),
                    name: "Violet"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.wheat),
                    name: "Wheat"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.white),
                    name: "White"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.whiteSmoke),
                    name: "White Smoke"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.yellow),
                    name: "Yellow"
                ),
                ColorName(
                    rgba: RGBAColor.from(color: UIColor.HTML.yellowGreen),
                    name: "Yellow Green"
                ),
            ]
            
            let currentRGBA = self.rgba
            
            var resultColorIndex: Int?
            var resultDistance: Double?
            let numberOfAvailableColorNames = colorNames.count
            
            for i in 0..<numberOfAvailableColorNames {
                let colorName = colorNames[i]
                let rgba = colorName.rgba
                
                let currentDistance = sqrt(
                    pow(Double(currentRGBA.red.integerValue - rgba.red.integerValue), 2)
                        + pow(Double(currentRGBA.green.integerValue - rgba.green.integerValue), 2)
                        + pow(Double(currentRGBA.blue.integerValue - rgba.blue.integerValue), 2)
                )
                
                let isAppropriateColor = resultDistance == nil ? true : currentDistance < resultDistance!
                
                if isAppropriateColor {
                    resultColorIndex = i
                    resultDistance = currentDistance
                }
            }
            
            guard (resultColorIndex != nil) && (resultDistance != nil) else {
                return nil
            }
            
            let maximumPossibleDistance = sqrt(pow(Double(RGBAComponent.maximumIntegerValue), 2) * 3.0)
            let accuracy = 1.0 - (resultDistance! / maximumPossibleDistance)
            
            return HTMLNameSearchResult(
                name: colorNames[resultColorIndex!].name,
                accuracy: accuracy
            )
        }
    }
    
}
