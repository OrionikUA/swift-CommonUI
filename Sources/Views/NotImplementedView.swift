import SwiftUI

public struct NotImplementedView: View {
    let viewName: String
    
    public init(viewName: String) {
        self.viewName = viewName
    }
    
    public var body: some View {
        Text("Not Implemented \(viewName)")
    }
}
