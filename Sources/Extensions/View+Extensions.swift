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
    
    // Foreground
    
    func conditionalForegroud(_ value: Color?) -> some View {
        if let color = value {
            return AnyView(self.foregroundColor(color))
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalForegroud(_ show: Bool, _ value: Color) -> some View {
        if (show) {
            return AnyView(self.foregroundColor(value))
        } else {
            return AnyView(self)
        }
    }
    
    // Background
    
    func conditionalBackground(_ value: Color?) -> some View {
        if let color = value {
            return AnyView(self.background(color))
        } else {
            return AnyView(self)
        }
    }
    
    func conditionalBackground(_ show: Bool, _ value: Color) -> some View {
        if (show) {
            return AnyView(self.background(value))
        } else {
            return AnyView(self)
        }
    }
}
