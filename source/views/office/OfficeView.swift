//
//  OfficeView.swift
//  DevSim
//
//  Created by Joe Noel on 01/09/2021.
//

import SwiftUI

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct OfficeView: View {

    static let personWidth: CGFloat = displayUnits(5)

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var store: Store

    var body: some View {
        ZStack {
            DeskView()
                .frame(width: deskSize.width, height: deskSize.height)

            ForEach(Array(store.state.game.staff.enumerated()), id: \.1.id) {
                index, element in
                PersonBlob()
                    .frame(width: Self.personWidth, height: Self.personWidth)
                    .offset(deskPosition(positionIndex: index))
            }
        }
    }

    enum Quadrant {
        case above
        case right
        case below
        case left
    }

    private func deskPosition(positionIndex: Int) -> CGSize {
        let (quadrant, indexInQuadrant) = quadrantFor(positionIndex: positionIndex)
        return offsetFor(quadrant: quadrant, indexInQuadrant: indexInQuadrant)
    }

    var deskSize: CGSize {
        let largeDimension: CGFloat = Self.personWidth * 6
        let smallDimension: CGFloat = Self.personWidth * 4

        return horizontalSizeClass == .compact
            ? CGSize(width: smallDimension, height: largeDimension)
            : CGSize(width: largeDimension, height: smallDimension)
    }

    var peopleOnWidth: Int {
        Int(floor(deskSize.width / (2 * Self.personWidth)))
    }

    var peopleOnHeight: Int {
        Int(floor(deskSize.height / (2 * Self.personWidth)))
    }

    var numSpaces: Int {
        2 * (peopleOnWidth + peopleOnHeight)
    }

    private func quadrantFor(positionIndex: Int) -> (Quadrant, Int) {
        precondition(positionIndex < numSpaces, "Invalid position index \(positionIndex)")

        let topLeftIndex = 0
        let topRightIndex = peopleOnWidth
        let bottomRightIndex = peopleOnWidth + peopleOnHeight
        let bottomLeftIndex = 2 * peopleOnWidth + peopleOnHeight

        switch positionIndex {
        case topLeftIndex..<topRightIndex:
            return (.above, positionIndex - topLeftIndex)
        case topRightIndex..<bottomRightIndex:
            return (.right, positionIndex - topRightIndex)
        case bottomRightIndex..<bottomLeftIndex:
            return (.below, positionIndex - bottomRightIndex)
        case bottomLeftIndex..<numSpaces:
            return (.left, positionIndex - bottomLeftIndex)
        default:
            return (.above, 0)
        }
    }

    private func offsetFor(quadrant: Quadrant, indexInQuadrant: Int) -> CGSize {
        let space = displayUnits(2.0)
        let halfDeskHeight = deskSize.height / 2
        let halfDeskWidth = deskSize.width / 2
        let halfPersonWidth = Self.personWidth / 2
        let offsetInQuadrant =
            Self.personWidth + 2 * CGFloat(indexInQuadrant) * Self.personWidth

        switch quadrant {
        case .above:
            return CGSize(
                width: -halfDeskWidth + offsetInQuadrant,
                height: -halfDeskHeight - halfPersonWidth - space)
        case .below:
            return CGSize(
                width: halfDeskWidth - offsetInQuadrant,
                height: halfDeskHeight + halfPersonWidth + space)
        case .left:
            return CGSize(
                width: -halfDeskWidth - halfPersonWidth - space,
                height: halfDeskHeight - offsetInQuadrant)
        case .right:
            return CGSize(
                width: halfDeskWidth + halfPersonWidth + space,
                height: -halfDeskHeight + offsetInQuadrant)
        }
    }
}

struct OfficeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("AppBackground")
            OfficeView().environmentObject(store)
        }
        .previewLayout(.fixed(width: 500, height: 500))
    }
}
