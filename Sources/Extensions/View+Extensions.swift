import Foundation
import SwiftUI

public extension View {
    @ViewBuilder
    func defaultMacOsConfig() -> some View {
        self
            .frame(minWidth: 1460, maxWidth: .infinity, minHeight: 890, maxHeight: .infinity, alignment: .center)
            .preferredColorScheme(.dark)
    }
}
