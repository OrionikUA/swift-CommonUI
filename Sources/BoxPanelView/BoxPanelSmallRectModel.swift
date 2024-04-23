import Foundation
import SwiftUI

public struct BoxPanelSmallRectModel {
    public let type: BoxPanelSmallRectType
    public let content: String
    public let color: Color?
    public let hoverContent: String?
    public let hoverColor: Color?
    public let action: (() -> Void)?
    
    public init(type: BoxPanelSmallRectType, content: String, color: Color? = nil, hoverContent: String? = nil, hoverColor: Color? = nil, action: (() -> Void)? = nil) {
        self.type = type
        self.content = content
        self.color = color
        self.hoverContent = hoverContent
        self.hoverColor = hoverColor
        self.action = action
    }
}
