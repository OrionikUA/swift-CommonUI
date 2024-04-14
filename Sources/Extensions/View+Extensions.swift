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
}
