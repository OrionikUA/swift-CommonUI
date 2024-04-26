import Foundation
import SwiftUI

public enum UiConstants {
    
    public enum AppFont {
        public static let baseSize: CGFloat = 12
        public static var base: Font = Font.system(size: baseSize, weight: .bold, design: .rounded)
        public static var small: Font = Font.system(size: baseSize - 2, weight: .bold, design: .rounded)
        public static var medium: Font = Font.system(size: baseSize + 2, weight: .bold, design: .rounded)
        public static var big: Font = Font.system(size: baseSize + 4, weight: .bold, design: .rounded)
    }
    
    public enum AppPadding {
        public static let base: CGFloat = 8
        public static var halfBase: CGFloat { base / 2 }
    }
    
    public enum AppCornerRadius {
        public static let base: CGFloat = 6
    }
    
    public enum AppIcon {
        public static let baseSize: CGFloat = 18
    }
    
    public enum AppColor {
        public static let zero: Color = Color(red: 1, green: 1, blue: 1, opacity: 0.001)
        public static let mainBackground: Color = Color(red: 0.118, green: 0.118, blue: 0.118, opacity: 1.000)
        public static let secondaryBackground: Color = Color(red: 0.137, green: 0.141, blue: 0.145, opacity: 1.000)
        public static var click: Color { .accentColor.opacity(0.8) }
        public static let hover: Color = Color(red: 0.208, green: 0.216, blue: 0.216, opacity: 1.000)
        public static var accentHover: Color { .accentColor.opacity(0.4) }
        public static var selected: Color { .accentColor }
    }
    
    public enum NotionColor {
        public enum Dark {
            public static let red: Color = Color(red: 0.431, green: 0.212, blue: 0.188, opacity: 1.000)
            public static let gray: Color = Color(red: 0.353, green: 0.353, blue: 0.353, opacity: 1.000)
            public static let yellow: Color = Color(red: 0.537, green: 0.388, blue: 0.165, opacity: 1.000)
            public static let orange: Color = Color(red: 0.522, green: 0.298, blue: 0.114, opacity: 1.000)
            public static let blue: Color = Color(red: 0.161, green: 0.271, blue: 0.424, opacity: 1.000)
            public static let green: Color = Color(red: 0.173, green: 0.349, blue: 0.247, opacity: 1.000)
            public static let pink: Color = Color(red: 0.412, green: 0.192, blue: 0.298, opacity: 1.000)
        }
        
        public enum Light {
            public static let red: Color = Color(red: 0.804, green: 0.286, blue: 0.275, opacity: 1.000)
            public static let gray: Color = Color(red: 0.608, green: 0.608, blue: 0.608, opacity: 1.000)
            public static let yellow: Color = Color(red: 0.792, green: 0.561, blue: 0.106, opacity: 1.000)
            public static let orange: Color = Color(red: 0.847, green: 0.463, blue: 0.125, opacity: 1.000)
            public static let blue: Color = Color(red: 0.180, green: 0.486, blue: 0.820, opacity: 1.000)
            public static let green: Color = Color(red: 0.176, green: 0.600, blue: 0.392, opacity: 1.000)
            public static let pink: Color = Color(red: 0.769, green: 0.263, blue: 0.529, opacity: 1.000)
        }
    }
}
