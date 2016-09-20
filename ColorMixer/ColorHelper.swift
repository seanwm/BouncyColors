//
//  ColorNamer.swift
//  ColorMixer
//
//  Created by Sean Mahan on 9/19/16.
//  Copyright © 2016 Intended Effect. All rights reserved.
//

import Foundation
import UIKit

@objc protocol  UIColorPrivate {
    func styleString() -> String
}

class ColorHelper
{
    
    let names : [MatchingColor] =
[
    MatchingColor(hexValue: "000000", name: "Black", redComponent: 0, greenComponent: 0, blueComponent: 0, hueComponent: 0, saturationComponent: 0, brightnessComponent: 0),
    MatchingColor(hexValue: "000080", name: "Navy Blue", redComponent: 0, greenComponent: 0, blueComponent: 128, hueComponent: 170, saturationComponent: 255, brightnessComponent: 64),
    MatchingColor(hexValue: "0000C8", name: "Dark Blue", redComponent: 0, greenComponent: 0, blueComponent: 200, hueComponent: 170, saturationComponent: 255, brightnessComponent: 100),
    MatchingColor(hexValue: "0000FF", name: "Blue", redComponent: 0, greenComponent: 0, blueComponent: 255, hueComponent: 170, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "003366", name: "Midnight Blue", redComponent: 0, greenComponent: 51, blueComponent: 102, hueComponent: 148, saturationComponent: 255, brightnessComponent: 51),
    MatchingColor(hexValue: "003532", name: "Deep Teal", redComponent: 0, greenComponent: 53, blueComponent: 50, hueComponent: 125, saturationComponent: 255, brightnessComponent: 26),
    MatchingColor(hexValue: "0047AB", name: "Cobalt", redComponent: 0, greenComponent: 71, blueComponent: 171, hueComponent: 152, saturationComponent: 255, brightnessComponent: 85),
    MatchingColor(hexValue: "007BA7", name: "Deep Cerulean", redComponent: 0, greenComponent: 123, blueComponent: 167, hueComponent: 138, saturationComponent: 255, brightnessComponent: 83),
    MatchingColor(hexValue: "008080", name: "Teal", redComponent: 0, greenComponent: 128, blueComponent: 128, hueComponent: 127, saturationComponent: 255, brightnessComponent: 64),
    MatchingColor(hexValue: "00A86B", name: "Jade", redComponent: 0, greenComponent: 168, blueComponent: 107, hueComponent: 112, saturationComponent: 255, brightnessComponent: 84),
    MatchingColor(hexValue: "00CCCC", name: "Robin's Egg Blue", redComponent: 0, greenComponent: 204, blueComponent: 204, hueComponent: 127, saturationComponent: 255, brightnessComponent: 102),
    MatchingColor(hexValue: "00FF00", name: "Green", redComponent: 0, greenComponent: 255, blueComponent: 0, hueComponent: 85, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "00FF7F", name: "Spring Green", redComponent: 0, greenComponent: 255, blueComponent: 127, hueComponent: 106, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "00FFFF", name: "Cyan", redComponent: 0, greenComponent: 255, blueComponent: 255, hueComponent: 127, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "01796F", name: "Pine Green", redComponent: 1, greenComponent: 121, blueComponent: 111, hueComponent: 123, saturationComponent: 250, brightnessComponent: 60),
    MatchingColor(hexValue: "02A4D3", name: "Cerulean", redComponent: 2, greenComponent: 164, blueComponent: 211, hueComponent: 137, saturationComponent: 250, brightnessComponent: 106),
    MatchingColor(hexValue: "044259", name: "Teal Blue", redComponent: 4, greenComponent: 66, blueComponent: 89, hueComponent: 139, saturationComponent: 233, brightnessComponent: 46),
    MatchingColor(hexValue: "069B81", name: "Gossamer", redComponent: 6, greenComponent: 155, blueComponent: 129, hueComponent: 120, saturationComponent: 235, brightnessComponent: 80),
    MatchingColor(hexValue: "08E8DE", name: "Bright Turquoise", redComponent: 8, greenComponent: 232, blueComponent: 222, hueComponent: 125, saturationComponent: 238, brightnessComponent: 120),
    MatchingColor(hexValue: "09230F", name: "Palm Green", redComponent: 9, greenComponent: 35, blueComponent: 15, hueComponent: 94, saturationComponent: 150, brightnessComponent: 22),
    MatchingColor(hexValue: "0BDA51", name: "Malachite", redComponent: 11, greenComponent: 218, blueComponent: 81, hueComponent: 99, saturationComponent: 230, brightnessComponent: 114),
    MatchingColor(hexValue: "0C0B1D", name: "Ebony", redComponent: 12, greenComponent: 11, blueComponent: 29, hueComponent: 172, saturationComponent: 114, brightnessComponent: 20),
    MatchingColor(hexValue: "120A8F", name: "Ultramarine", redComponent: 18, greenComponent: 10, blueComponent: 143, hueComponent: 172, saturationComponent: 221, brightnessComponent: 76),
    MatchingColor(hexValue: "161D10", name: "Hunter Green", redComponent: 22, greenComponent: 29, blueComponent: 16, hueComponent: 65, saturationComponent: 73, brightnessComponent: 22),
    MatchingColor(hexValue: "220878", name: "Deep Blue", redComponent: 34, greenComponent: 8, blueComponent: 120, hueComponent: 179, saturationComponent: 223, brightnessComponent: 64),
    MatchingColor(hexValue: "228B22", name: "Forest Green", redComponent: 34, greenComponent: 139, blueComponent: 34, hueComponent: 85, saturationComponent: 154, brightnessComponent: 86),
    MatchingColor(hexValue: "240A40", name: "Violet", redComponent: 36, greenComponent: 10, blueComponent: 64, hueComponent: 190, saturationComponent: 186, brightnessComponent: 36),
    MatchingColor(hexValue: "251607", name: "Graphite", redComponent: 37, greenComponent: 22, blueComponent: 7, hueComponent: 21, saturationComponent: 173, brightnessComponent: 22),
    MatchingColor(hexValue: "2A52BE", name: "Cerulean Blue", redComponent: 42, greenComponent: 82, blueComponent: 190, hueComponent: 158, saturationComponent: 162, brightnessComponent: 116),
    MatchingColor(hexValue: "2E8B57", name: "Sea Green", redComponent: 46, greenComponent: 139, blueComponent: 87, hueComponent: 103, saturationComponent: 128, brightnessComponent: 92),
    MatchingColor(hexValue: "2F519E", name: "Sapphire", redComponent: 47, greenComponent: 81, blueComponent: 158, hueComponent: 156, saturationComponent: 138, brightnessComponent: 102),
    MatchingColor(hexValue: "301F1E", name: "Cocoa Brown", redComponent: 48, greenComponent: 31, blueComponent: 30, hueComponent: 2, saturationComponent: 58, brightnessComponent: 39),
    MatchingColor(hexValue: "315BA1", name: "Azure", redComponent: 49, greenComponent: 91, blueComponent: 161, hueComponent: 154, saturationComponent: 136, brightnessComponent: 105),
    MatchingColor(hexValue: "32127A", name: "Persian Indigo", redComponent: 50, greenComponent: 18, blueComponent: 122, hueComponent: 183, saturationComponent: 189, brightnessComponent: 70),
    MatchingColor(hexValue: "370202", name: "Chocolate", redComponent: 55, greenComponent: 2, blueComponent: 2, hueComponent: 0, saturationComponent: 237, brightnessComponent: 28),
    MatchingColor(hexValue: "3B0910", name: "Aubergine", redComponent: 59, greenComponent: 9, blueComponent: 16, hueComponent: -5, saturationComponent: 187, brightnessComponent: 34),
    MatchingColor(hexValue: "3C2005", name: "Dark Ebony", redComponent: 60, greenComponent: 32, blueComponent: 5, hueComponent: 20, saturationComponent: 215, brightnessComponent: 32),
    MatchingColor(hexValue: "3C4151", name: "Bright Gray", redComponent: 60, greenComponent: 65, blueComponent: 81, hueComponent: 159, saturationComponent: 37, brightnessComponent: 70),
    MatchingColor(hexValue: "3C4443", name: "Cape Cod", redComponent: 60, greenComponent: 68, blueComponent: 67, hueComponent: 122, saturationComponent: 15, brightnessComponent: 64),
    MatchingColor(hexValue: "3F2109", name: "Bronze", redComponent: 63, greenComponent: 33, blueComponent: 9, hueComponent: 18, saturationComponent: 191, brightnessComponent: 36),
    MatchingColor(hexValue: "40291D", name: "Cork", redComponent: 64, greenComponent: 41, blueComponent: 29, hueComponent: 14, saturationComponent: 95, brightnessComponent: 46),
    MatchingColor(hexValue: "4169E1", name: "Royal Blue", redComponent: 65, greenComponent: 105, blueComponent: 225, hueComponent: 159, saturationComponent: 185, brightnessComponent: 145),
    MatchingColor(hexValue: "420303", name: "Burnt Maroon", redComponent: 66, greenComponent: 3, blueComponent: 3, hueComponent: 0, saturationComponent: 232, brightnessComponent: 34),
    MatchingColor(hexValue: "41AA78", name: "Ocean Green", redComponent: 65, greenComponent: 170, blueComponent: 120, hueComponent: 107, saturationComponent: 113, brightnessComponent: 117),
    MatchingColor(hexValue: "436A0D", name: "Green Leaf", redComponent: 67, greenComponent: 106, blueComponent: 13, hueComponent: 60, saturationComponent: 199, brightnessComponent: 59),
    MatchingColor(hexValue: "462425", name: "Crater Brown", redComponent: 70, greenComponent: 36, blueComponent: 37, hueComponent: -1, saturationComponent: 81, brightnessComponent: 53),
    MatchingColor(hexValue: "4682B4", name: "Steel Blue", redComponent: 70, greenComponent: 130, blueComponent: 180, hueComponent: 146, saturationComponent: 112, brightnessComponent: 125),
    MatchingColor(hexValue: "481C1C", name: "Cocoa Bean", redComponent: 72, greenComponent: 28, blueComponent: 28, hueComponent: 0, saturationComponent: 112, brightnessComponent: 50),
    MatchingColor(hexValue: "483131", name: "Woody Brown", redComponent: 72, greenComponent: 49, blueComponent: 49, hueComponent: 0, saturationComponent: 48, brightnessComponent: 60),
    MatchingColor(hexValue: "483C32", name: "Taupe", redComponent: 72, greenComponent: 60, blueComponent: 50, hueComponent: 19, saturationComponent: 45, brightnessComponent: 60),
    MatchingColor(hexValue: "4A3004", name: "Deep Bronze", redComponent: 74, greenComponent: 48, blueComponent: 4, hueComponent: 26, saturationComponent: 228, brightnessComponent: 39),
    MatchingColor(hexValue: "4B0082", name: "Pigment Indigo", redComponent: 75, greenComponent: 0, blueComponent: 130, hueComponent: 194, saturationComponent: 255, brightnessComponent: 65),
    MatchingColor(hexValue: "4A444B", name: "Gravel", redComponent: 74, greenComponent: 68, blueComponent: 75, hueComponent: 206, saturationComponent: 12, brightnessComponent: 71),
    MatchingColor(hexValue: "4D400F", name: "Bronzetone", redComponent: 77, greenComponent: 64, blueComponent: 15, hueComponent: 33, saturationComponent: 171, brightnessComponent: 46),
    MatchingColor(hexValue: "4E0606", name: "Mahogany", redComponent: 78, greenComponent: 6, blueComponent: 6, hueComponent: 0, saturationComponent: 218, brightnessComponent: 42),
    MatchingColor(hexValue: "4E420C", name: "Bronze Olive", redComponent: 78, greenComponent: 66, blueComponent: 12, hueComponent: 34, saturationComponent: 187, brightnessComponent: 45),
    MatchingColor(hexValue: "4F69C6", name: "Indigo", redComponent: 79, greenComponent: 105, blueComponent: 198, hueComponent: 160, saturationComponent: 130, brightnessComponent: 138),
    MatchingColor(hexValue: "50C878", name: "Emerald", redComponent: 80, greenComponent: 200, blueComponent: 120, hueComponent: 99, saturationComponent: 133, brightnessComponent: 140),
    MatchingColor(hexValue: "5D5E37", name: "Verdigris", redComponent: 93, greenComponent: 94, blueComponent: 55, hueComponent: 43, saturationComponent: 66, brightnessComponent: 74),
    MatchingColor(hexValue: "5F5F6E", name: "Mid Gray", redComponent: 95, greenComponent: 95, blueComponent: 110, hueComponent: 170, saturationComponent: 18, brightnessComponent: 102),
    MatchingColor(hexValue: "612718", name: "Espresso", redComponent: 97, greenComponent: 39, blueComponent: 24, hueComponent: 8, saturationComponent: 153, brightnessComponent: 60),
    MatchingColor(hexValue: "614051", name: "Eggplant", redComponent: 97, greenComponent: 64, blueComponent: 81, hueComponent: -21, saturationComponent: 52, brightnessComponent: 80),
    MatchingColor(hexValue: "6456B7", name: "Blue Violet", redComponent: 100, greenComponent: 86, blueComponent: 183, hueComponent: 176, saturationComponent: 102, brightnessComponent: 134),
    MatchingColor(hexValue: "6495ED", name: "Cornflower Blue", redComponent: 100, greenComponent: 149, blueComponent: 237, hueComponent: 154, saturationComponent: 201, brightnessComponent: 168),
    MatchingColor(hexValue: "660099", name: "Purple", redComponent: 102, greenComponent: 0, blueComponent: 153, hueComponent: 198, saturationComponent: 255, brightnessComponent: 76),
    MatchingColor(hexValue: "661010", name: "Dark Tan", redComponent: 102, greenComponent: 16, blueComponent: 16, hueComponent: 0, saturationComponent: 185, brightnessComponent: 59),
    MatchingColor(hexValue: "66FF00", name: "Bright Green", redComponent: 102, greenComponent: 255, blueComponent: 0, hueComponent: 68, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "6B3FA0", name: "Royal Purple", redComponent: 107, greenComponent: 63, blueComponent: 160, hueComponent: 189, saturationComponent: 110, brightnessComponent: 111),
    MatchingColor(hexValue: "704214", name: "Sepia", redComponent: 112, greenComponent: 66, blueComponent: 20, hueComponent: 21, saturationComponent: 177, brightnessComponent: 65),
    MatchingColor(hexValue: "708090", name: "Slate Gray", redComponent: 112, greenComponent: 128, blueComponent: 144, hueComponent: 148, saturationComponent: 32, brightnessComponent: 128),
    MatchingColor(hexValue: "716E10", name: "Olivetone", redComponent: 113, greenComponent: 110, blueComponent: 16, hueComponent: 41, saturationComponent: 191, brightnessComponent: 64),
    MatchingColor(hexValue: "71D9E2", name: "Aquamarine Blue", redComponent: 113, greenComponent: 217, blueComponent: 226, hueComponent: 130, saturationComponent: 168, brightnessComponent: 169),
    MatchingColor(hexValue: "72010F", name: "Venetian Red", redComponent: 114, greenComponent: 1, blueComponent: 15, hueComponent: -5, saturationComponent: 250, brightnessComponent: 57),
    MatchingColor(hexValue: "734A12", name: "Raw Umber", redComponent: 115, greenComponent: 74, blueComponent: 18, hueComponent: 24, saturationComponent: 185, brightnessComponent: 66),
    MatchingColor(hexValue: "706555", name: "Coffee", redComponent: 112, greenComponent: 101, blueComponent: 85, hueComponent: 25, saturationComponent: 34, brightnessComponent: 98),
    MatchingColor(hexValue: "76D7EA", name: "Sky Blue", redComponent: 118, greenComponent: 215, blueComponent: 234, hueComponent: 134, saturationComponent: 187, brightnessComponent: 176),
    MatchingColor(hexValue: "770F05", name: "Dark Burgundy", redComponent: 119, greenComponent: 15, blueComponent: 5, hueComponent: 3, saturationComponent: 234, brightnessComponent: 62),
    MatchingColor(hexValue: "77DD77", name: "Pastel Green", redComponent: 119, greenComponent: 221, blueComponent: 119, hueComponent: 85, saturationComponent: 153, brightnessComponent: 170),
    MatchingColor(hexValue: "782D19", name: "Mocha", redComponent: 120, greenComponent: 45, blueComponent: 25, hueComponent: 8, saturationComponent: 167, brightnessComponent: 72),
    MatchingColor(hexValue: "78866B", name: "Camouflage Green", redComponent: 120, greenComponent: 134, blueComponent: 107, hueComponent: 64, saturationComponent: 28, brightnessComponent: 120),
    MatchingColor(hexValue: "796878", name: "Old Lavender", redComponent: 121, greenComponent: 104, blueComponent: 120, hueComponent: -40, saturationComponent: 19, brightnessComponent: 112),
    MatchingColor(hexValue: "796D62", name: "Sandstone", redComponent: 121, greenComponent: 109, blueComponent: 98, hueComponent: 20, saturationComponent: 26, brightnessComponent: 109),
    MatchingColor(hexValue: "7A58C1", name: "Fuchsia Blue", redComponent: 122, greenComponent: 88, blueComponent: 193, hueComponent: 183, saturationComponent: 116, brightnessComponent: 140),
    MatchingColor(hexValue: "7C778A", name: "Topaz", redComponent: 124, greenComponent: 119, blueComponent: 138, hueComponent: 181, saturationComponent: 19, brightnessComponent: 128),
    MatchingColor(hexValue: "7FFF00", name: "Chartreuse", redComponent: 127, greenComponent: 255, blueComponent: 0, hueComponent: 63, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "7FFFD4", name: "Aquamarine", redComponent: 127, greenComponent: 255, blueComponent: 212, hueComponent: 113, saturationComponent: 255, brightnessComponent: 191),
    MatchingColor(hexValue: "800000", name: "Maroon", redComponent: 128, greenComponent: 0, blueComponent: 0, hueComponent: 0, saturationComponent: 255, brightnessComponent: 64),
    MatchingColor(hexValue: "803790", name: "Vivid Violet", redComponent: 128, greenComponent: 55, blueComponent: 144, hueComponent: 204, saturationComponent: 114, brightnessComponent: 99),
    MatchingColor(hexValue: "80461B", name: "Russet", redComponent: 128, greenComponent: 70, blueComponent: 27, hueComponent: 18, saturationComponent: 166, brightnessComponent: 77),
    MatchingColor(hexValue: "808000", name: "Olive", redComponent: 128, greenComponent: 128, blueComponent: 0, hueComponent: 42, saturationComponent: 255, brightnessComponent: 64),
    MatchingColor(hexValue: "808080", name: "Gray", redComponent: 128, greenComponent: 128, blueComponent: 128, hueComponent: 0, saturationComponent: 0, brightnessComponent: 128),
    MatchingColor(hexValue: "828F72", name: "Battleship Gray", redComponent: 130, greenComponent: 143, blueComponent: 114, hueComponent: 61, saturationComponent: 29, brightnessComponent: 128),
    MatchingColor(hexValue: "831923", name: "Merlot", redComponent: 131, greenComponent: 25, blueComponent: 35, hueComponent: -4, saturationComponent: 173, brightnessComponent: 77),
    MatchingColor(hexValue: "843179", name: "Plum", redComponent: 132, greenComponent: 49, blueComponent: 121, hueComponent: -36, saturationComponent: 116, brightnessComponent: 90),
    MatchingColor(hexValue: "888D65", name: "Avocado", redComponent: 136, greenComponent: 141, blueComponent: 101, hueComponent: 47, saturationComponent: 42, brightnessComponent: 121),
    MatchingColor(hexValue: "893843", name: "Solid Pink", redComponent: 137, greenComponent: 56, blueComponent: 67, hueComponent: -5, saturationComponent: 107, brightnessComponent: 96),
    MatchingColor(hexValue: "8A3324", name: "Burnt Umber", redComponent: 138, greenComponent: 51, blueComponent: 36, hueComponent: 6, saturationComponent: 149, brightnessComponent: 87),
    MatchingColor(hexValue: "8B00FF", name: "Electric Violet", redComponent: 139, greenComponent: 0, blueComponent: 255, hueComponent: 193, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "900020", name: "Burgundy", redComponent: 144, greenComponent: 0, blueComponent: 32, hueComponent: -9, saturationComponent: 255, brightnessComponent: 72),
    MatchingColor(hexValue: "9370DB", name: "Medium Purple", redComponent: 147, greenComponent: 112, blueComponent: 219, hueComponent: 183, saturationComponent: 152, brightnessComponent: 165),
    MatchingColor(hexValue: "93CCEA", name: "Cornflower", redComponent: 147, greenComponent: 204, blueComponent: 234, hueComponent: 142, saturationComponent: 171, brightnessComponent: 190),
    MatchingColor(hexValue: "950015", name: "Scarlett", redComponent: 149, greenComponent: 0, blueComponent: 21, hueComponent: -5, saturationComponent: 255, brightnessComponent: 74),
    MatchingColor(hexValue: "960018", name: "Carmine", redComponent: 150, greenComponent: 0, blueComponent: 24, hueComponent: -6, saturationComponent: 255, brightnessComponent: 75),
    MatchingColor(hexValue: "964B00", name: "Brown", redComponent: 150, greenComponent: 75, blueComponent: 0, hueComponent: 21, saturationComponent: 255, brightnessComponent: 75),
    MatchingColor(hexValue: "967BB6", name: "Lavender Purple", redComponent: 150, greenComponent: 123, blueComponent: 182, hueComponent: 189, saturationComponent: 73, brightnessComponent: 152),
    MatchingColor(hexValue: "96A8A1", name: "Pewter", redComponent: 150, greenComponent: 168, blueComponent: 161, hueComponent: 110, saturationComponent: 23, brightnessComponent: 159),
    MatchingColor(hexValue: "98FF98", name: "Mint Green", redComponent: 152, greenComponent: 255, blueComponent: 152, hueComponent: 85, saturationComponent: 255, brightnessComponent: 203),
    MatchingColor(hexValue: "990066", name: "Fresh Eggplant", redComponent: 153, greenComponent: 0, blueComponent: 102, hueComponent: -28, saturationComponent: 255, brightnessComponent: 76),
    MatchingColor(hexValue: "991199", name: "Violet Eggplant", redComponent: 153, greenComponent: 17, blueComponent: 153, hueComponent: -42, saturationComponent: 204, brightnessComponent: 85),
    MatchingColor(hexValue: "9966CC", name: "Amethyst", redComponent: 153, greenComponent: 102, blueComponent: 204, hueComponent: 191, saturationComponent: 127, brightnessComponent: 153),
    MatchingColor(hexValue: "9DC209", name: "Pistachio", redComponent: 157, greenComponent: 194, blueComponent: 9, hueComponent: 50, saturationComponent: 232, brightnessComponent: 101),
    MatchingColor(hexValue: "9EA587", name: "Sage", redComponent: 158, greenComponent: 165, blueComponent: 135, hueComponent: 52, saturationComponent: 36, brightnessComponent: 150),
    MatchingColor(hexValue: "A7882C", name: "Luxor Gold", redComponent: 167, greenComponent: 136, blueComponent: 44, hueComponent: 31, saturationComponent: 148, brightnessComponent: 105),
    MatchingColor(hexValue: "A85307", name: "Rich Gold", redComponent: 168, greenComponent: 83, blueComponent: 7, hueComponent: 20, saturationComponent: 234, brightnessComponent: 87),
    MatchingColor(hexValue: "A8989B", name: "Dusty Gray", redComponent: 168, greenComponent: 152, blueComponent: 155, hueComponent: -7, saturationComponent: 21, brightnessComponent: 160),
    MatchingColor(hexValue: "A899E6", name: "Dull Lavender", redComponent: 168, greenComponent: 153, blueComponent: 230, hueComponent: 178, saturationComponent: 154, brightnessComponent: 191),
    MatchingColor(hexValue: "A9A491", name: "Gray Olive", redComponent: 169, greenComponent: 164, blueComponent: 145, hueComponent: 33, saturationComponent: 31, brightnessComponent: 157),
    MatchingColor(hexValue: "ADFF2F", name: "Green Yellow", redComponent: 173, greenComponent: 255, blueComponent: 47, hueComponent: 59, saturationComponent: 255, brightnessComponent: 151),
    MatchingColor(hexValue: "AE4560", name: "Hippie Pink", redComponent: 174, greenComponent: 69, blueComponent: 96, hueComponent: -10, saturationComponent: 110, brightnessComponent: 121),
    MatchingColor(hexValue: "AF593E", name: "Brown Rust", redComponent: 175, greenComponent: 89, blueComponent: 62, hueComponent: 10, saturationComponent: 121, brightnessComponent: 118),
    MatchingColor(hexValue: "B0E0E6", name: "Powder Blue", redComponent: 176, greenComponent: 224, blueComponent: 230, hueComponent: 132, saturationComponent: 132, brightnessComponent: 203),
    MatchingColor(hexValue: "B10000", name: "Bright Red", redComponent: 177, greenComponent: 0, blueComponent: 0, hueComponent: 0, saturationComponent: 255, brightnessComponent: 88),
    MatchingColor(hexValue: "B1610B", name: "Pumpkin Skin", redComponent: 177, greenComponent: 97, blueComponent: 11, hueComponent: 22, saturationComponent: 225, brightnessComponent: 93),
    MatchingColor(hexValue: "B35213", name: "Fiery Orange", redComponent: 179, greenComponent: 82, blueComponent: 19, hueComponent: 16, saturationComponent: 206, brightnessComponent: 98),
    MatchingColor(hexValue: "B3AF95", name: "Taupe Gray", redComponent: 179, greenComponent: 175, blueComponent: 149, hueComponent: 36, saturationComponent: 42, brightnessComponent: 163),
    MatchingColor(hexValue: "B57EDC", name: "Lavender", redComponent: 181, greenComponent: 126, blueComponent: 220, hueComponent: 194, saturationComponent: 146, brightnessComponent: 173),
    MatchingColor(hexValue: "B5B35C", name: "Olive Green", redComponent: 181, greenComponent: 179, blueComponent: 92, hueComponent: 41, saturationComponent: 95, brightnessComponent: 136),
    MatchingColor(hexValue: "B7410E", name: "Rust", redComponent: 183, greenComponent: 65, blueComponent: 14, hueComponent: 12, saturationComponent: 218, brightnessComponent: 98),
    MatchingColor(hexValue: "B87333", name: "Copper", redComponent: 184, greenComponent: 115, blueComponent: 51, hueComponent: 20, saturationComponent: 144, brightnessComponent: 117),
    MatchingColor(hexValue: "B8C25D", name: "Celery", redComponent: 184, greenComponent: 194, blueComponent: 93, hueComponent: 46, saturationComponent: 115, brightnessComponent: 143),
    MatchingColor(hexValue: "B94E48", name: "Chestnut", redComponent: 185, greenComponent: 78, blueComponent: 72, hueComponent: 2, saturationComponent: 113, brightnessComponent: 128),
    MatchingColor(hexValue: "B98D28", name: "Marigold", redComponent: 185, greenComponent: 141, blueComponent: 40, hueComponent: 29, saturationComponent: 164, brightnessComponent: 112),
    MatchingColor(hexValue: "BB3385", name: "Medium Red Violet", redComponent: 187, greenComponent: 51, blueComponent: 133, hueComponent: -25, saturationComponent: 145, brightnessComponent: 119),
    MatchingColor(hexValue: "BDBBD7", name: "Lavender Gray", redComponent: 189, greenComponent: 187, blueComponent: 215, hueComponent: 173, saturationComponent: 66, brightnessComponent: 201),
    MatchingColor(hexValue: "BDBDC6", name: "French Gray", redComponent: 189, greenComponent: 189, blueComponent: 198, hueComponent: 170, saturationComponent: 18, brightnessComponent: 193),
    MatchingColor(hexValue: "BEB5B7", name: "Pink Swan", redComponent: 190, greenComponent: 181, blueComponent: 183, hueComponent: -9, saturationComponent: 16, brightnessComponent: 185),
    MatchingColor(hexValue: "BFFF00", name: "Lime", redComponent: 191, greenComponent: 255, blueComponent: 0, hueComponent: 53, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "C08081", name: "Old Rose", redComponent: 192, greenComponent: 128, blueComponent: 129, hueComponent: 0, saturationComponent: 85, brightnessComponent: 160),
    MatchingColor(hexValue: "C0C0C0", name: "Silver", redComponent: 192, greenComponent: 192, blueComponent: 192, hueComponent: 0, saturationComponent: 0, brightnessComponent: 192),
    MatchingColor(hexValue: "C154C1", name: "Fuchsia Pink", redComponent: 193, greenComponent: 84, blueComponent: 193, hueComponent: -42, saturationComponent: 119, brightnessComponent: 138),
    MatchingColor(hexValue: "C2BDB6", name: "Cotton Seed", redComponent: 194, greenComponent: 189, blueComponent: 182, hueComponent: 24, saturationComponent: 22, brightnessComponent: 188),
    MatchingColor(hexValue: "C3B091", name: "Indian Khaki", redComponent: 195, greenComponent: 176, blueComponent: 145, hueComponent: 26, saturationComponent: 74, brightnessComponent: 170),
    MatchingColor(hexValue: "C32148", name: "Maroon Flush", redComponent: 195, greenComponent: 33, blueComponent: 72, hueComponent: -10, saturationComponent: 181, brightnessComponent: 113),
    MatchingColor(hexValue: "C3BFC1", name: "Pale Slate", redComponent: 195, greenComponent: 191, blueComponent: 193, hueComponent: -21, saturationComponent: 8, brightnessComponent: 193),
    MatchingColor(hexValue: "C3C3BD", name: "Gray Nickel", redComponent: 195, greenComponent: 195, blueComponent: 189, hueComponent: 42, saturationComponent: 12, brightnessComponent: 192),
    MatchingColor(hexValue: "C3CDE6", name: "Periwinkle Gray", redComponent: 195, greenComponent: 205, blueComponent: 230, hueComponent: 157, saturationComponent: 105, brightnessComponent: 212),
    MatchingColor(hexValue: "C41E3A", name: "Cardinal", redComponent: 196, greenComponent: 30, blueComponent: 58, hueComponent: -7, saturationComponent: 187, brightnessComponent: 113),
    MatchingColor(hexValue: "C4C4BC", name: "Mist Gray", redComponent: 196, greenComponent: 196, blueComponent: 188, hueComponent: 42, saturationComponent: 16, brightnessComponent: 192),
    MatchingColor(hexValue: "C5E17A", name: "Yellow Green", redComponent: 197, greenComponent: 225, blueComponent: 122, hueComponent: 54, saturationComponent: 161, brightnessComponent: 173),
    MatchingColor(hexValue: "C62D42", name: "Brick Red", redComponent: 198, greenComponent: 45, blueComponent: 66, hueComponent: -5, saturationComponent: 160, brightnessComponent: 121),
    MatchingColor(hexValue: "C69191", name: "Oriental Pink", redComponent: 198, greenComponent: 145, blueComponent: 145, hueComponent: 0, saturationComponent: 80, brightnessComponent: 171),
    MatchingColor(hexValue: "C71585", name: "Red Violet", redComponent: 199, greenComponent: 21, blueComponent: 133, hueComponent: -26, saturationComponent: 206, brightnessComponent: 110),
    MatchingColor(hexValue: "C8A2C8", name: "Lilac", redComponent: 200, greenComponent: 162, blueComponent: 200, hueComponent: -42, saturationComponent: 65, brightnessComponent: 180),
    MatchingColor(hexValue: "CC5500", name: "Burnt Orange", redComponent: 204, greenComponent: 85, blueComponent: 0, hueComponent: 17, saturationComponent: 255, brightnessComponent: 102),
    MatchingColor(hexValue: "CC7722", name: "Ochre", redComponent: 204, greenComponent: 119, blueComponent: 34, hueComponent: 21, saturationComponent: 182, brightnessComponent: 119),
    MatchingColor(hexValue: "CC8899", name: "Puce", redComponent: 204, greenComponent: 136, blueComponent: 153, hueComponent: -10, saturationComponent: 102, brightnessComponent: 170),
    MatchingColor(hexValue: "CCCCFF", name: "Periwinkle", redComponent: 204, greenComponent: 204, blueComponent: 255, hueComponent: 170, saturationComponent: 255, brightnessComponent: 229),
    MatchingColor(hexValue: "CCFF00", name: "Electric Lime", redComponent: 204, greenComponent: 255, blueComponent: 0, hueComponent: 50, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "D2B48C", name: "Tan", redComponent: 210, greenComponent: 180, blueComponent: 140, hueComponent: 24, saturationComponent: 111, brightnessComponent: 175),
    MatchingColor(hexValue: "D3CBBA", name: "Sisal", redComponent: 211, greenComponent: 203, blueComponent: 186, hueComponent: 28, saturationComponent: 56, brightnessComponent: 198),
    MatchingColor(hexValue: "D4BF8D", name: "Straw", redComponent: 212, greenComponent: 191, blueComponent: 141, hueComponent: 29, saturationComponent: 115, brightnessComponent: 176),
    MatchingColor(hexValue: "D4D7D9", name: "Iron", redComponent: 212, greenComponent: 215, blueComponent: 217, hueComponent: 144, saturationComponent: 15, brightnessComponent: 214),
    MatchingColor(hexValue: "D69188", name: "My Pink", redComponent: 214, greenComponent: 145, blueComponent: 136, hueComponent: 4, saturationComponent: 124, brightnessComponent: 175),
    MatchingColor(hexValue: "D7837F", name: "New York Pink", redComponent: 215, greenComponent: 131, blueComponent: 127, hueComponent: 1, saturationComponent: 133, brightnessComponent: 171),
    MatchingColor(hexValue: "DB5079", name: "Cranberry", redComponent: 219, greenComponent: 80, blueComponent: 121, hueComponent: -12, saturationComponent: 167, brightnessComponent: 149),
    MatchingColor(hexValue: "DC143C", name: "Crimson", redComponent: 220, greenComponent: 20, blueComponent: 60, hueComponent: -8, saturationComponent: 212, brightnessComponent: 120),
    MatchingColor(hexValue: "DEE5C0", name: "Beryl Green", redComponent: 222, greenComponent: 229, blueComponent: 192, hueComponent: 50, saturationComponent: 106, brightnessComponent: 210),
    MatchingColor(hexValue: "DFFF00", name: "Chartreuse Yellow", redComponent: 223, greenComponent: 255, blueComponent: 0, hueComponent: 47, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "E0B0FF", name: "Mauve", redComponent: 224, greenComponent: 176, blueComponent: 255, hueComponent: 195, saturationComponent: 255, brightnessComponent: 215),
    MatchingColor(hexValue: "E0B974", name: "Harvest Gold", redComponent: 224, greenComponent: 185, blueComponent: 116, hueComponent: 27, saturationComponent: 162, brightnessComponent: 170),
    MatchingColor(hexValue: "E0FFFF", name: "Baby Blue", redComponent: 224, greenComponent: 255, blueComponent: 255, hueComponent: 127, saturationComponent: 255, brightnessComponent: 239),
    MatchingColor(hexValue: "E2725B", name: "Terracotta", redComponent: 226, greenComponent: 114, blueComponent: 91, hueComponent: 7, saturationComponent: 178, brightnessComponent: 158),
    MatchingColor(hexValue: "E3F5E1", name: "Peppermint", redComponent: 227, greenComponent: 245, blueComponent: 225, hueComponent: 80, saturationComponent: 127, brightnessComponent: 235),
    MatchingColor(hexValue: "E6F8F3", name: "Off Green", redComponent: 230, greenComponent: 248, blueComponent: 243, hueComponent: 115, saturationComponent: 143, brightnessComponent: 239),
    MatchingColor(hexValue: "E6FFE9", name: "Hint of Green", redComponent: 230, greenComponent: 255, blueComponent: 233, hueComponent: 90, saturationComponent: 254, brightnessComponent: 242),
    MatchingColor(hexValue: "E77200", name: "Mango Tango", redComponent: 231, greenComponent: 114, blueComponent: 0, hueComponent: 20, saturationComponent: 255, brightnessComponent: 115),
    MatchingColor(hexValue: "E79F8C", name: "Tonys Pink", redComponent: 231, greenComponent: 159, blueComponent: 140, hueComponent: 8, saturationComponent: 166, brightnessComponent: 185),
    MatchingColor(hexValue: "E8EBE0", name: "Green White", redComponent: 232, greenComponent: 235, blueComponent: 224, hueComponent: 54, saturationComponent: 54, brightnessComponent: 229),
    MatchingColor(hexValue: "E96E00", name: "Clementine", redComponent: 233, greenComponent: 110, blueComponent: 0, hueComponent: 20, saturationComponent: 255, brightnessComponent: 116),
    MatchingColor(hexValue: "E97451", name: "Burnt Sienna", redComponent: 233, greenComponent: 116, blueComponent: 81, hueComponent: 9, saturationComponent: 197, brightnessComponent: 157),
    MatchingColor(hexValue: "EB9373", name: "Apricot", redComponent: 235, greenComponent: 147, blueComponent: 115, hueComponent: 11, saturationComponent: 191, brightnessComponent: 175),
    MatchingColor(hexValue: "ED9121", name: "Carrot Orange", redComponent: 237, greenComponent: 145, blueComponent: 33, hueComponent: 23, saturationComponent: 216, brightnessComponent: 135),
    MatchingColor(hexValue: "EDC9AF", name: "Desert Sand", redComponent: 237, greenComponent: 201, blueComponent: 175, hueComponent: 17, saturationComponent: 161, brightnessComponent: 206),
    MatchingColor(hexValue: "EDEA99", name: "Primrose", redComponent: 237, greenComponent: 234, blueComponent: 153, hueComponent: 40, saturationComponent: 178, brightnessComponent: 195),
    MatchingColor(hexValue: "EDF5DD", name: "Frost", redComponent: 237, greenComponent: 245, blueComponent: 221, hueComponent: 56, saturationComponent: 139, brightnessComponent: 233),
    MatchingColor(hexValue: "EE82EE", name: "Lavender Magenta", redComponent: 238, greenComponent: 130, blueComponent: 238, hueComponent: -42, saturationComponent: 193, brightnessComponent: 184),
    MatchingColor(hexValue: "EED9C4", name: "Almond", redComponent: 238, greenComponent: 217, blueComponent: 196, hueComponent: 21, saturationComponent: 140, brightnessComponent: 217),
    MatchingColor(hexValue: "EEDC82", name: "Flax", redComponent: 238, greenComponent: 220, blueComponent: 130, hueComponent: 35, saturationComponent: 193, brightnessComponent: 184),
    MatchingColor(hexValue: "EEFDFF", name: "Twilight Blue", redComponent: 238, greenComponent: 253, blueComponent: 255, hueComponent: 132, saturationComponent: 255, brightnessComponent: 246),
    MatchingColor(hexValue: "EFF2F3", name: "Porcelain", redComponent: 239, greenComponent: 242, blueComponent: 243, hueComponent: 138, saturationComponent: 36, brightnessComponent: 241),
    MatchingColor(hexValue: "F0E68C", name: "Khaki", redComponent: 240, greenComponent: 230, blueComponent: 140, hueComponent: 38, saturationComponent: 196, brightnessComponent: 190),
    MatchingColor(hexValue: "F0EEFF", name: "Titian White", redComponent: 240, greenComponent: 238, blueComponent: 255, hueComponent: 174, saturationComponent: 255, brightnessComponent: 246),
    MatchingColor(hexValue: "F1E9D2", name: "Parchment", redComponent: 241, greenComponent: 233, blueComponent: 210, hueComponent: 31, saturationComponent: 133, brightnessComponent: 225),
    MatchingColor(hexValue: "F2552A", name: "Flamingo", redComponent: 242, greenComponent: 85, blueComponent: 42, hueComponent: 9, saturationComponent: 225, brightnessComponent: 142),
    MatchingColor(hexValue: "F28500", name: "Tangerine", redComponent: 242, greenComponent: 133, blueComponent: 0, hueComponent: 23, saturationComponent: 255, brightnessComponent: 121),
    MatchingColor(hexValue: "F34723", name: "Pomegranate", redComponent: 243, greenComponent: 71, blueComponent: 35, hueComponent: 7, saturationComponent: 228, brightnessComponent: 139),
    MatchingColor(hexValue: "F3AD16", name: "Buttercup", redComponent: 243, greenComponent: 173, blueComponent: 22, hueComponent: 29, saturationComponent: 230, brightnessComponent: 132),
    MatchingColor(hexValue: "F3E9E5", name: "Dawn Pink", redComponent: 243, greenComponent: 233, blueComponent: 229, hueComponent: 12, saturationComponent: 93, brightnessComponent: 236),
    MatchingColor(hexValue: "F3FB62", name: "Canary", redComponent: 243, greenComponent: 251, blueComponent: 98, hueComponent: 44, saturationComponent: 242, brightnessComponent: 174),
    MatchingColor(hexValue: "F4A460", name: "Sandy brown", redComponent: 244, greenComponent: 164, blueComponent: 96, hueComponent: 19, saturationComponent: 222, brightnessComponent: 170),
    MatchingColor(hexValue: "F4C430", name: "Saffron", redComponent: 244, greenComponent: 196, blueComponent: 48, hueComponent: 32, saturationComponent: 229, brightnessComponent: 146),
    MatchingColor(hexValue: "F4D81C", name: "Ripe Lemon", redComponent: 244, greenComponent: 216, blueComponent: 28, hueComponent: 36, saturationComponent: 231, brightnessComponent: 136),
    MatchingColor(hexValue: "F5F3E5", name: "Ecru White", redComponent: 245, greenComponent: 243, blueComponent: 229, hueComponent: 37, saturationComponent: 113, brightnessComponent: 237),
    MatchingColor(hexValue: "F5F5DC", name: "Beige", redComponent: 245, greenComponent: 245, blueComponent: 220, hueComponent: 42, saturationComponent: 141, brightnessComponent: 232),
    MatchingColor(hexValue: "F7468A", name: "Violet Red", redComponent: 247, greenComponent: 70, blueComponent: 138, hueComponent: -16, saturationComponent: 233, brightnessComponent: 158),
    MatchingColor(hexValue: "F8DD5C", name: "Energy Yellow", redComponent: 248, greenComponent: 221, blueComponent: 92, hueComponent: 35, saturationComponent: 234, brightnessComponent: 170),
    MatchingColor(hexValue: "F95A61", name: "Carnation", redComponent: 249, greenComponent: 90, blueComponent: 97, hueComponent: -1, saturationComponent: 237, brightnessComponent: 169),
    MatchingColor(hexValue: "F9E0ED", name: "Carousel Pink", redComponent: 249, greenComponent: 224, blueComponent: 237, hueComponent: -22, saturationComponent: 172, brightnessComponent: 236),
    MatchingColor(hexValue: "F9E4BC", name: "Dairy Cream", redComponent: 249, greenComponent: 228, blueComponent: 188, hueComponent: 27, saturationComponent: 213, brightnessComponent: 218),
    MatchingColor(hexValue: "FA9D5A", name: "Tan Hide", redComponent: 250, greenComponent: 157, blueComponent: 90, hueComponent: 17, saturationComponent: 239, brightnessComponent: 170),
    MatchingColor(hexValue: "FADFAD", name: "Peach Yellow", redComponent: 250, greenComponent: 223, blueComponent: 173, hueComponent: 27, saturationComponent: 225, brightnessComponent: 211),
    MatchingColor(hexValue: "FAFAFA", name: "Alabaster", redComponent: 250, greenComponent: 250, blueComponent: 250, hueComponent: 0, saturationComponent: 0, brightnessComponent: 250),
    MatchingColor(hexValue: "FB607F", name: "Brink Pink", redComponent: 251, greenComponent: 96, blueComponent: 127, hueComponent: -8, saturationComponent: 242, brightnessComponent: 173),
    MatchingColor(hexValue: "FBA0E3", name: "Lavender Rose", redComponent: 251, greenComponent: 160, blueComponent: 227, hueComponent: -31, saturationComponent: 234, brightnessComponent: 205),
    MatchingColor(hexValue: "FBAED2", name: "Lavender Pink", redComponent: 251, greenComponent: 174, blueComponent: 210, hueComponent: -19, saturationComponent: 230, brightnessComponent: 212),
    MatchingColor(hexValue: "FBB2A3", name: "Rose Bud", redComponent: 251, greenComponent: 178, blueComponent: 163, hueComponent: 7, saturationComponent: 233, brightnessComponent: 207),
    MatchingColor(hexValue: "FBCCE7", name: "Classic Rose", redComponent: 251, greenComponent: 204, blueComponent: 231, hueComponent: -24, saturationComponent: 217, brightnessComponent: 227),
    MatchingColor(hexValue: "FBCEB1", name: "Apricot Peach", redComponent: 251, greenComponent: 206, blueComponent: 177, hueComponent: 16, saturationComponent: 230, brightnessComponent: 213),
    MatchingColor(hexValue: "FBE870", name: "Marigold Yellow", redComponent: 251, greenComponent: 232, blueComponent: 112, hueComponent: 36, saturationComponent: 241, brightnessComponent: 181),
    MatchingColor(hexValue: "FC0FC0", name: "Shocking Pink", redComponent: 252, greenComponent: 15, blueComponent: 192, hueComponent: -31, saturationComponent: 248, brightnessComponent: 133),
    MatchingColor(hexValue: "FCC01E", name: "Lightning Yellow", redComponent: 252, greenComponent: 192, blueComponent: 30, hueComponent: 31, saturationComponent: 248, brightnessComponent: 141),
    MatchingColor(hexValue: "FCD667", name: "Goldenrod", redComponent: 252, greenComponent: 214, blueComponent: 103, hueComponent: 31, saturationComponent: 245, brightnessComponent: 177),
    MatchingColor(hexValue: "FD9FA2", name: "Sweet Pink", redComponent: 253, greenComponent: 159, blueComponent: 162, hueComponent: -1, saturationComponent: 244, brightnessComponent: 206),
    MatchingColor(hexValue: "FDD5B1", name: "Light Apricot", redComponent: 253, greenComponent: 213, blueComponent: 177, hueComponent: 20, saturationComponent: 242, brightnessComponent: 215),
    MatchingColor(hexValue: "FDD7E4", name: "Pig Pink", redComponent: 253, greenComponent: 215, blueComponent: 228, hueComponent: -14, saturationComponent: 230, brightnessComponent: 234),
    MatchingColor(hexValue: "FDE910", name: "Lemon", redComponent: 253, greenComponent: 233, blueComponent: 16, hueComponent: 38, saturationComponent: 250, brightnessComponent: 134),
    MatchingColor(hexValue: "FE4C40", name: "Sunset Orange", redComponent: 254, greenComponent: 76, blueComponent: 64, hueComponent: 2, saturationComponent: 252, brightnessComponent: 159),
    MatchingColor(hexValue: "FEBAAD", name: "Melon", redComponent: 254, greenComponent: 186, blueComponent: 173, hueComponent: 6, saturationComponent: 248, brightnessComponent: 213),
    MatchingColor(hexValue: "FED85D", name: "Dandelion", redComponent: 254, greenComponent: 216, blueComponent: 93, hueComponent: 32, saturationComponent: 251, brightnessComponent: 173),
    MatchingColor(hexValue: "FEF9E3", name: "Off Yellow", redComponent: 254, greenComponent: 249, blueComponent: 227, hueComponent: 34, saturationComponent: 237, brightnessComponent: 240),
    MatchingColor(hexValue: "FEFCED", name: "Orange White", redComponent: 254, greenComponent: 252, blueComponent: 237, hueComponent: 37, saturationComponent: 228, brightnessComponent: 245),
    MatchingColor(hexValue: "FF0000", name: "Red", redComponent: 255, greenComponent: 0, blueComponent: 0, hueComponent: 0, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FF007F", name: "Rose", redComponent: 255, greenComponent: 0, blueComponent: 127, hueComponent: -21, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FF2400", name: "Scarlet", redComponent: 255, greenComponent: 36, blueComponent: 0, hueComponent: 6, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FF3399", name: "Wild Strawberry", redComponent: 255, greenComponent: 51, blueComponent: 153, hueComponent: -21, saturationComponent: 255, brightnessComponent: 153),
    MatchingColor(hexValue: "FF33CC", name: "Razzle Dazzle Rose", redComponent: 255, greenComponent: 51, blueComponent: 204, hueComponent: -31, saturationComponent: 255, brightnessComponent: 153),
    MatchingColor(hexValue: "FF00FF", name: "Magenta / Fuchsia", redComponent: 255, greenComponent: 0, blueComponent: 255, hueComponent: -42, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FF3F34", name: "Red Orange", redComponent: 255, greenComponent: 63, blueComponent: 52, hueComponent: 2, saturationComponent: 255, brightnessComponent: 153),
    MatchingColor(hexValue: "FF4040", name: "Coral Red", redComponent: 255, greenComponent: 64, blueComponent: 64, hueComponent: 0, saturationComponent: 255, brightnessComponent: 159),
    MatchingColor(hexValue: "FF4D00", name: "Vermilion", redComponent: 255, greenComponent: 77, blueComponent: 0, hueComponent: 12, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FF66FF", name: "Pink Flamingo", redComponent: 255, greenComponent: 102, blueComponent: 255, hueComponent: -42, saturationComponent: 254, brightnessComponent: 178),
    MatchingColor(hexValue: "FF681F", name: "Orange", redComponent: 255, greenComponent: 104, blueComponent: 31, hueComponent: 13, saturationComponent: 255, brightnessComponent: 143),
    MatchingColor(hexValue: "FF69B4", name: "Hot Pink", redComponent: 255, greenComponent: 105, blueComponent: 180, hueComponent: -21, saturationComponent: 254, brightnessComponent: 179),
    MatchingColor(hexValue: "FF6FFF", name: "Blush Pink", redComponent: 255, greenComponent: 111, blueComponent: 255, hueComponent: -42, saturationComponent: 255, brightnessComponent: 183),
    MatchingColor(hexValue: "FF7518", name: "Pumpkin", redComponent: 255, greenComponent: 117, blueComponent: 24, hueComponent: 17, saturationComponent: 255, brightnessComponent: 139),
    MatchingColor(hexValue: "FF7F50", name: "Coral", redComponent: 255, greenComponent: 127, blueComponent: 80, hueComponent: 11, saturationComponent: 255, brightnessComponent: 167),
    MatchingColor(hexValue: "FF8C69", name: "Salmon", redComponent: 255, greenComponent: 140, blueComponent: 105, hueComponent: 9, saturationComponent: 254, brightnessComponent: 179),
    MatchingColor(hexValue: "FF91A4", name: "Pink Salmon", redComponent: 255, greenComponent: 145, blueComponent: 164, hueComponent: -7, saturationComponent: 255, brightnessComponent: 200),
    MatchingColor(hexValue: "FF9966", name: "Atomic Tangerine", redComponent: 255, greenComponent: 153, blueComponent: 102, hueComponent: 14, saturationComponent: 254, brightnessComponent: 178),
    MatchingColor(hexValue: "FF9980", name: "Vivid Tangerine", redComponent: 255, greenComponent: 153, blueComponent: 128, hueComponent: 8, saturationComponent: 255, brightnessComponent: 191),
    MatchingColor(hexValue: "FFA000", name: "Orange Peel", redComponent: 255, greenComponent: 160, blueComponent: 0, hueComponent: 26, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FFA6C9", name: "Carnation Pink", redComponent: 255, greenComponent: 166, blueComponent: 201, hueComponent: -16, saturationComponent: 254, brightnessComponent: 210),
    MatchingColor(hexValue: "FFAE42", name: "Yellow Orange", redComponent: 255, greenComponent: 174, blueComponent: 66, hueComponent: 24, saturationComponent: 255, brightnessComponent: 160),
    MatchingColor(hexValue: "FFBF00", name: "Amber", redComponent: 255, greenComponent: 191, blueComponent: 0, hueComponent: 31, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FFC0CB", name: "Pink", redComponent: 255, greenComponent: 192, blueComponent: 203, hueComponent: -7, saturationComponent: 255, brightnessComponent: 223),
    MatchingColor(hexValue: "FFC3C0", name: "Your Pink", redComponent: 255, greenComponent: 195, blueComponent: 192, hueComponent: 2, saturationComponent: 255, brightnessComponent: 223),
    MatchingColor(hexValue: "FFCC99", name: "Peach Orange", redComponent: 255, greenComponent: 204, blueComponent: 153, hueComponent: 21, saturationComponent: 255, brightnessComponent: 204),
    MatchingColor(hexValue: "FFCD8C", name: "Chardonnay", redComponent: 255, greenComponent: 205, blueComponent: 140, hueComponent: 24, saturationComponent: 255, brightnessComponent: 197),
    MatchingColor(hexValue: "FFD700", name: "Gold", redComponent: 255, greenComponent: 215, blueComponent: 0, hueComponent: 35, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FFD800", name: "School bus Yellow", redComponent: 255, greenComponent: 216, blueComponent: 0, hueComponent: 36, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FFDB58", name: "Mustard", redComponent: 255, greenComponent: 219, blueComponent: 88, hueComponent: 33, saturationComponent: 255, brightnessComponent: 171),
    MatchingColor(hexValue: "FFDDAF", name: "Caramel", redComponent: 255, greenComponent: 221, blueComponent: 175, hueComponent: 24, saturationComponent: 255, brightnessComponent: 215),
    MatchingColor(hexValue: "FFDEAD", name: "Navajo White", redComponent: 255, greenComponent: 222, blueComponent: 173, hueComponent: 25, saturationComponent: 255, brightnessComponent: 214),
    MatchingColor(hexValue: "FFE5A0", name: "Cream Brulee", redComponent: 255, greenComponent: 229, blueComponent: 160, hueComponent: 30, saturationComponent: 255, brightnessComponent: 207),
    MatchingColor(hexValue: "FFE5B4", name: "Peach", redComponent: 255, greenComponent: 229, blueComponent: 180, hueComponent: 27, saturationComponent: 255, brightnessComponent: 217),
    MatchingColor(hexValue: "FFD1DC", name: "Pastel Pink", redComponent: 255, greenComponent: 209, blueComponent: 220, hueComponent: -10, saturationComponent: 255, brightnessComponent: 232),
    MatchingColor(hexValue: "FFEDBC", name: "Colonial White", redComponent: 255, greenComponent: 237, blueComponent: 188, hueComponent: 31, saturationComponent: 255, brightnessComponent: 221),
    MatchingColor(hexValue: "FFEFEC", name: "Fair Pink", redComponent: 255, greenComponent: 239, blueComponent: 236, hueComponent: 6, saturationComponent: 255, brightnessComponent: 245),
    MatchingColor(hexValue: "FFF0DB", name: "Peach Cream", redComponent: 255, greenComponent: 240, blueComponent: 219, hueComponent: 24, saturationComponent: 255, brightnessComponent: 237),
    MatchingColor(hexValue: "FFF0F5", name: "Lavender blush", redComponent: 255, greenComponent: 240, blueComponent: 245, hueComponent: -14, saturationComponent: 255, brightnessComponent: 247),
    MatchingColor(hexValue: "FFF1B5", name: "Buttermilk", redComponent: 255, greenComponent: 241, blueComponent: 181, hueComponent: 34, saturationComponent: 255, brightnessComponent: 218),
    MatchingColor(hexValue: "FFF5EE", name: "Seashell Peach", redComponent: 255, greenComponent: 245, blueComponent: 238, hueComponent: 17, saturationComponent: 255, brightnessComponent: 246),
    MatchingColor(hexValue: "FFF6F5", name: "Rose White", redComponent: 255, greenComponent: 246, blueComponent: 245, hueComponent: 4, saturationComponent: 255, brightnessComponent: 250),
    MatchingColor(hexValue: "FFF8D1", name: "Baja White", redComponent: 255, greenComponent: 248, blueComponent: 209, hueComponent: 36, saturationComponent: 255, brightnessComponent: 232),
    MatchingColor(hexValue: "FFFACD", name: "Lemon Chiffon", redComponent: 255, greenComponent: 250, blueComponent: 205, hueComponent: 38, saturationComponent: 255, brightnessComponent: 230),
    MatchingColor(hexValue: "FFFBF9", name: "Soapstone", redComponent: 255, greenComponent: 251, blueComponent: 249, hueComponent: 14, saturationComponent: 255, brightnessComponent: 252),
    MatchingColor(hexValue: "FFFCEA", name: "Buttery White", redComponent: 255, greenComponent: 252, blueComponent: 234, hueComponent: 36, saturationComponent: 254, brightnessComponent: 244),
    MatchingColor(hexValue: "FFFDD0", name: "Cream", redComponent: 255, greenComponent: 253, blueComponent: 208, hueComponent: 40, saturationComponent: 255, brightnessComponent: 231),
    MatchingColor(hexValue: "FFFDE8", name: "Travertine", redComponent: 255, greenComponent: 253, blueComponent: 232, hueComponent: 38, saturationComponent: 254, brightnessComponent: 243),
    MatchingColor(hexValue: "FFFF00", name: "Yellow", redComponent: 255, greenComponent: 255, blueComponent: 0, hueComponent: 42, saturationComponent: 255, brightnessComponent: 127),
    MatchingColor(hexValue: "FFFF66", name: "Laser Lemon", redComponent: 255, greenComponent: 255, blueComponent: 102, hueComponent: 42, saturationComponent: 254, brightnessComponent: 178),
    MatchingColor(hexValue: "FFFF99", name: "Pale Canary", redComponent: 255, greenComponent: 255, blueComponent: 153, hueComponent: 42, saturationComponent: 255, brightnessComponent: 204),
    
    MatchingColor(hexValue: "FFFFF0", name: "Ivory", redComponent: 255, greenComponent: 255, blueComponent: 240, hueComponent: 42, saturationComponent: 255, brightnessComponent: 247),
    MatchingColor(hexValue: "FFFFFF", name: "White", redComponent: 255, greenComponent: 255, blueComponent: 255, hueComponent: 0, saturationComponent: 0, brightnessComponent: 255)
]
    func nameFor(color : UIColor) -> String
    {
        let matchInfo = getColorInfo(color: color)

        var ndf1 : CGFloat = 0
        var ndf2 : CGFloat = 0
        var ndf : CGFloat = 0
        var cl : MatchingColor?
        var df : CGFloat = -1
        
        for (matchColor) in names
        {
            ndf1 = CGFloat(pow(matchInfo.redComponent - matchColor.redComponent, 2)) + CGFloat(pow(matchInfo.greenComponent - matchColor.greenComponent, 2)) + CGFloat(pow(matchInfo.blueComponent - matchColor.blueComponent, 2))
            ndf2 = CGFloat(pow(matchInfo.hueComponent - matchColor.hueComponent, 2))
                + CGFloat(pow(matchInfo.saturationComponent - matchColor.saturationComponent, 2))
                + CGFloat(pow(matchInfo.brightnessComponent - matchColor.brightnessComponent, 2))
            ndf = ndf1 + ndf2 * 2;
            if(df < 0 || df > ndf)
            {
                df = ndf;
                cl = matchColor;
            }
        }
        
        return cl!.name
    }

    func toRGB(c:Float, m:Float, y:Float, k:Float) -> [Float]
    {
        var rgb = [Float]()
        rgb.append(-((c * (255-k)) / 255 + k - 255))
        rgb.append(-((m * (255-k)) / 255 + k - 255))
        rgb.append(-((y * (255-k)) / 255 + k - 255))
        return rgb
    }

    
    func toCMYK(red:Float, green:Float, blue:Float) -> [Float]
    {
        let k: Float = min(255-red,min(255-green,255-blue))
        let c: Float = 255*(255-red-k)/(255-k)
        let m: Float = 255*(255-green-k)/(255-k)
        let y: Float = 255*(255-blue-k)/(255-k)
        
        var cmyk = [Float]()
        cmyk.append(c.isNaN ? 0 : c)
        cmyk.append(m.isNaN ? 0 : m)
        cmyk.append(y.isNaN ? 0 : y)
        cmyk.append(k.isNaN ? 0 : k)
        return cmyk
    }

    func getColorInfo(color : UIColor)->MatchingColor {
        
        var hue : CGFloat = 0
        var sat : CGFloat = 0
        var bright : CGFloat = 0
        var alpha : CGFloat = 0
        
        color.getHue(&hue, saturation: &sat, brightness: &bright, alpha: &alpha) //.getRed(&rcRed, green: &rcGreen, blue: &rcBlue, alpha: &rcAlpha)
        
        let colorPrivate = unsafeBitCast(color, to: UIColorPrivate.self)
        
        let styleStr = colorPrivate.styleString()
        
        let strRGB = styleStr.components(separatedBy: ",")
        
        var strRed = strRGB[0]
        strRed = strRed[strRed.index(strRed.startIndex, offsetBy: 4)..<strRed.endIndex]
        
        var strGreen = strRGB[1]
        strGreen = strGreen[strGreen.startIndex..<strGreen.endIndex]
        
        var strBlue = strRGB[2]
        strBlue = strBlue[strBlue.startIndex..<strBlue.index(strBlue.endIndex, offsetBy:-1)]
        
        var fltRed = Float(strRed)
        var fltGreen = Float(strGreen)
        var fltBlue = Float(strBlue)
        
        if (fltRed != nil && fltRed! > 255)
        {
            fltRed = 255;
        }
        if (fltGreen != nil && fltGreen! > 255)
        {
            fltGreen = 255;
        }
        if (fltBlue != nil && fltBlue! > 255)
        {
            fltBlue = 255;
        }
        
        if (fltRed == nil || fltRed! < 0)
        {
            fltRed = 0;
        }
        if (fltGreen == nil || fltGreen! < 0)
        {
            fltGreen = 0;
        }
        if (fltBlue == nil || fltBlue! < 0)
        {
            fltBlue = 0;
        }
        
        let returnColor = MatchingColor(hexValue:"", name: "", redComponent:CGFloat(fltRed!), greenComponent: CGFloat(fltGreen!), blueComponent: CGFloat(fltBlue!), hueComponent: hue*255.0, saturationComponent: sat*255.0, brightnessComponent:bright*255.0)

        return returnColor
    }
    
    func calculateMixedColor(colorBasket : [UIColor])->UIColor
    {
        var cyans = [Float]()
        var magentas = [Float]()
        var yellows = [Float]()
        var blacks = [Float]()
        
        for color in colorBasket
        {
            let colorInfo = getColorInfo(color: color)
            
            let cmyk = toCMYK(red: Float(colorInfo.redComponent), green: Float(colorInfo.greenComponent), blue: Float(colorInfo.blueComponent))
            
            cyans.append(cmyk[0])
            magentas.append(cmyk[1])
            yellows.append(cmyk[2])
            blacks.append(cmyk[3])
        }
        
        let finalCyan = Float(cyans.reduce(0, +))/Float(cyans.count)
        let finalMagenta = Float(magentas.reduce(0, +))/Float(cyans.count)
        let finalYellow = Float(yellows.reduce(0, +))/Float(cyans.count)
        let finalBlack = Float(blacks.reduce(0, +))/Float(cyans.count)
        
        var finalRGB = toRGB(c: finalCyan, m: finalMagenta, y: finalYellow, k: finalBlack)
        
        return UIColor(
            colorLiteralRed: finalRGB[0]/255,
            green: finalRGB[1]/255,
            blue: finalRGB[2]/255,
            alpha: 1.0)
        
    }
    

}
