import Foundation
import SwiftUI

public extension View {
    
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    @ViewBuilder
    func defaultMacOsConfig() -> some View {
        self
            .frame(minWidth: 1460, maxWidth: .infinity, minHeight: 890, maxHeight: .infinity, alignment: .center)
            .preferredColorScheme(.dark)
    }
    
    // Frame
    
    func conditionalFrameMaxHight(_ array: [CGFloat?]) -> some View {
        for arrayHeight in array {
            if let arrayHeight = arrayHeight {
                return AnyView(self.frame(maxHeight: arrayHeight))
            }
        }
        return AnyView(self)
    }
    
    // Foreground
    
    func conditionalForegroud(_ value: Color?) -> some View {
        if let color = value {
            AnyView(self.foregroundColor(color))
        } else {
            AnyView(self)
        }
    }
    
    func conditionalForegroud(_ show: Bool, _ value: Color) -> some View {
        if (show) {
            AnyView(self.foregroundColor(value))
        } else {
            AnyView(self)
        }
    }
    
    func conditionalForegroud(_ array: [Color?], _ defaultColor: Color?) -> some View {
        for arrayColor in array {
            if let arrayColor = arrayColor {
                return AnyView(self.foregroundColor(arrayColor))
            }
        }
        if let defaultColor = defaultColor {
            return AnyView(self.foregroundColor(defaultColor))
        }
        return AnyView(self)
    }
    
    // Background
    
    func conditionalBackground(_ value: Color?) -> some View {
        if let color = value {
            AnyView(self.background(color))
        } else {
            AnyView(self)
        }
    }
    
    
    func conditionalBackground(_ show: Bool, _ value: Color) -> some View {
        if (show) {
            AnyView(self.background(value))
        } else {
            AnyView(self)
        }
    }
    
    func conditionalBackground(_ array: [Color?]) -> some View {
        for arrayColor in array {
            if let arrayColor = arrayColor {
                return AnyView(self.background(arrayColor))
            }
        }
        return AnyView(self)
    }
    
    // Hand Hover
    
    func conditionalHandHover<T>(show: Bool, value: T, isHovering: Binding<T?>) -> some View {
        return AnyView(self.onHover { hover in
            if (show) {
                if hover {
                    NSCursor.pointingHand.set()
                    isHovering.wrappedValue = value
                } else {
                    NSCursor.arrow.set()
                    isHovering.wrappedValue = nil
                }
            } else {
                NSCursor.arrow.set()
            }
        })
    }
}
