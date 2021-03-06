// Kevin Li - 11:49 PM - 6/23/20

import SwiftUI

struct ElegantVListExample: View {

    let manager = ElegantListManager(pageCount: listData.count)

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ElegantVList(manager: manager,
                         pageTurnType: .earlyCutOffDefault,
                         viewForPage: exampleView)
                .onPageChanged { page in
                    print("Page \(page) will display")
                }

            ScrollToPageButton(pageCount: listData.count, action: animatedScroll)
                .padding(.top, 90)
                .padding(.trailing, 30)
        }
    }

    private func exampleView(for page: Int) -> AnyView {
        ExampleView(page: page).erased
    }

    private func animatedScroll(to page: Int) {
        manager.scroll(to: page)
    }

    private func unanimatedScroll(to page: Int) {
        manager.scroll(to: page, animated: false)
    }

}

struct ElegantVListExample_Previews: PreviewProvider {
    static var previews: some View {
        ElegantVListExample()
    }
}
