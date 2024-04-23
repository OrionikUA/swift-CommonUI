import Foundation
import SwiftUI
import AppKit

struct BoxPanelView: View {
    
    let first: BoxPanelSmallRectModel?
    let second: BoxPanelSmallRectModel?
    let main: BoxPanelSmallRectModel
    let third: BoxPanelSmallRectModel?
    let fourth: BoxPanelSmallRectModel?
    
    @State var firstViewHover: Bool = false
    @State var secondViewHover: Bool = false
    @State var mainViewHover: Bool = false
    @State var thirdViewHover: Bool = false
    @State var fourthViewHover: Bool = false
    
    @State var firstViewClick: Bool = false
    @State var secondViewClick: Bool = false
    @State var mainViewClick: Bool = false
    @State var thirdViewClick: Bool = false
    @State var fourthViewClick: Bool = false
    
    init(main: BoxPanelSmallRectModel, first: BoxPanelSmallRectModel? = nil, second: BoxPanelSmallRectModel? = nil, third: BoxPanelSmallRectModel? = nil, fourth: BoxPanelSmallRectModel? = nil) {
        self.first = first
        self.second = second
        self.main = main
        self.third = third
        self.fourth = fourth
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                Divider()
                if let firstModel = self.first {
                    createView(input: firstModel, isHovering: $firstViewHover, isClick: $firstViewClick)
                        .frame(maxWidth: 32)
                    Divider()
                }
                if let secondModel = self.second {
                    createView(input: secondModel, isHovering: $secondViewHover, isClick: $secondViewClick)
                        .frame(maxWidth: 32)
                    Divider()
                }
                createView(input: main, isHovering: $mainViewHover, isClick: $mainViewClick)
                if let thirdModel = self.third {
                    Divider()
                    createView(input: thirdModel, isHovering: $thirdViewHover, isClick: $thirdViewClick)
                        .frame(maxWidth: 32)
                }
                if let fourthModel = self.fourth {
                    Divider()
                    createView(input: fourthModel, isHovering: $fourthViewHover, isClick: $fourthViewClick)
                        .frame(maxWidth: 32)
                }
                Divider()
            }
            Divider()
        }
    }
    
    @ViewBuilder
    func createView(input: BoxPanelSmallRectModel, isHovering: Binding<Bool>, isClick: Binding<Bool>) -> some View {
        creteControl(input: input, isHovering: isHovering, isClick: isClick)
            .padding(UiConstants.AppPadding.base)
            .onHover { hoverValue in
                if (input.action != nil) {
                    isHovering.wrappedValue = hoverValue
                }
            }
            .conditionalOnTapGesture(action: input.action != nil ? { isClick.wrappedValue = true; input.action!() } : nil)
            .conditionalBackground([
                isClick.wrappedValue ? UiConstants.AppColor.click : nil,
                input.action != nil && isHovering.wrappedValue ? UiConstants.AppColor.hover : nil,
                UiConstants.AppColor.zero
            ])
            .onChange(of: isClick.wrappedValue) { oldValue, newValue in
                if newValue == true {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        isClick.wrappedValue = false
                    }
                }
            }
    }
    
    @ViewBuilder
    func creteControl(input: BoxPanelSmallRectModel, isHovering: Binding<Bool>, isClick: Binding<Bool>) -> some View {
        let content: () -> String = {
            isHovering.wrappedValue && input.hoverContent != nil ? input.hoverContent! : input.content
        }
        let foregroundColor: () -> Color = {
            isHovering.wrappedValue && input.hoverColor != nil ? input.hoverColor! : (input.color ?? .primary)
        }
        
        Group {
            switch (input.type) {
            case .text:
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        Text(content())
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
            case .systemImage:
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        Image(systemName: content())
                            .frame(maxWidth: UiConstants.AppIcon.baseSize, maxHeight:  UiConstants.AppIcon.baseSize)
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
            case .image:
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        if let url = URL(string: content()) {
                            AsyncImageView(url: url, maxImageSize: UiConstants.AppIcon.baseSize)
                        }
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
            }
        }
        .foregroundStyle(foregroundColor())
    }
}
