import Foundation
import LibraryDemo_CocoaButton

extension Libraries {
    
    static let CocoaButton = Library(
        id: "cocoa-button",
        name: "CocoaButton",
        description: .init(
            short: "Stylish UIButton with loading animation capability",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "CocoaButton",
            subtitle: "Stylish UIButton with loading animation capability"
        ),
        developers: [
            .init(
                name: "Edgar Žigis",
                contactInformation: ContactInformation(
                    email: "admin@bio-matic.com",
                    website: "https://www.linkedin.com/in/edgar-%C5%BEigis-48b668a7"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "edgar-zigis",
                repository: "CocoaButton"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "CocoaButton"
            ),
            carthage: CarthageIntegration.github(
                withPath: "edgar-zigis/CocoaButton"
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demo: LibraryDemo(
            screen: DemoScreen(
                viewControllerClass: LibraryDemoViewController.self,
                nibName: "LibraryDemoViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-CocoaButton",
                enabled: true
            )
        )
    )
}
