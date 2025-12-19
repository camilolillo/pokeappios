import SwiftUI

enum SourceTab {
    case all
    case favorites
}


struct SourceTabBar: View {

    let selectedTab: SourceTab
    let onTabSelected: (SourceTab) -> Void

    var body: some View {
        HStack(spacing: 16) {
            tabButton(title: "ALL", tab: .all)
            tabButton(title: "FAVORITES", tab: .favorites)
        }
        .padding(.horizontal, 24)
    }

    private func tabButton(title: String, tab: SourceTab) -> some View {
        Button {
            onTabSelected(tab)
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(selectedTab == tab ? .white : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .fill(selectedTab == tab ? Color.primaryColor : Color.clear)
                )
        }
    }
}
