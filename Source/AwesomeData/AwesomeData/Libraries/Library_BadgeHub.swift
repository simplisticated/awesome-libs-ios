import Foundation
import LibraryDemo_BadgeHub

extension Libraries {
    
    static let BadgeHub = Library(
        id: "badge-hub",
        name: "BadgeHub",
        description: .init(
            short: "A way to quickly add a notification badge icon to any view",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "BadgeHub",
            subtitle: "A way to quickly add a notification badge icon to any view"
        ),
        developers: [
            .init(
                name: "Jogendra",
                contactInformation: ContactInformation(
                    email: "jogendra.kumar.phy15@iitbhu.ac.in",
                    website: "https://jogendra.dev"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "jogendra",
                repository: "BadgeHub"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "BadgeHub"
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
                viewControllerClass: BadgeHub_LibraryDemoViewController.self,
                nibName: "BadgeHub_LibraryDemoViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-BadgeHub",
                enabled: true
            )
        )
    )
}
