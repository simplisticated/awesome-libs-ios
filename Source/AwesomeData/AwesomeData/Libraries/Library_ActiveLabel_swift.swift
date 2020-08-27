import Foundation
import LibraryDemo_ActiveLabel_swift

extension Libraries {
    
    static let ActiveLabel_swift = Library(
        id: "ActiveLabel.swift",
        name: "ActiveLabel\n.swift",
        description: .init(
            short: "UILabel drop-in replacement supporting Hashtags (#), Mentions (@), URLs (http://) and custom regex patterns",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "ActiveLabel.swift",
            subtitle: "UILabel drop-in replacement supporting Hashtags (#), Mentions (@), URLs (http://) and custom regex patterns"
        ),
        developers: [
            .init(
                name: "Optonaut",
                contactInformation: ContactInformation(
                    email: "hello@optonaut.co",
                    website: "http://optonaut.co"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "optonaut",
                repository: "ActiveLabel.swift"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'ActiveLabel'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"optonaut/ActiveLabel.swift\""
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demo: LibraryDemo(
            screen: DemoScreen(
                viewControllerClass: ActiveLabel_LibraryDemoViewController.self,
                nibName: "ActiveLabel_LibraryDemoViewController",
                bundleIdentifier: Bundle.LibraryDemo_ActiveLabel_swift_identifier,
                enabled: true
            )
        )
    )
}
