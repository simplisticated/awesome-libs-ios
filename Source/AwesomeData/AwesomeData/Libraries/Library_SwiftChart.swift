import Foundation
import LibraryDemo_SwiftChart

extension Libraries {
    
    static let SwiftChart = Library(
        id: "swiftchart",
        name: "SwiftChart",
        description: .init(
            short: "A simple line and area charting library",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "SwiftChart",
            subtitle: "A simple line and area charting library"
        ),
        developers: [
            .init(
                name: "gpbl",
                contactInformation: ContactInformation(
                    email: "io@gpbl.dev",
                    website: "httos://twitter.com/gpblv"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "gpbl",
                repository: "SwiftChart"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "SwiftChart"
            ),
            carthage: nil,
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demo: LibraryDemo(
            screen: DemoScreen(
                viewControllerClass: TableViewController.self,
                nibName: "TableViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-SwiftChart",
                enabled: false
            )
        )
    )
}
