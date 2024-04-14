import Foundation
import SwiftUI

public enum UiConstants {
    
    public enum AppFont {
        public static let baseSize: CGFloat = 12
        public static var base: Font = Font.system(size: baseSize, weight: .bold, design: .rounded)
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
}
