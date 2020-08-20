import Foundation
import LibraryDemo_CocoaTextField

extension Libraries {
    
    static let CocoaTextField = Library(
        id: "cocoa-text-field",
        name: "CocoaTextField",
        description: .init(
            short: "Highly customizable text field created according to Material.IO guidelines",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "CocoaTextField",
            subtitle: "Highly customizable text field created according to Material.IO guidelines"
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
                repository: "CocoaTextField"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'CocoaTextField'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"edgar-zigis/CocoaTextField\""
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demoScreen: .init(
            viewControllerClass: LibraryDemoViewController.self,
            nibName: "LibraryDemoViewController",
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-CocoaTextField",
            enabled: true
        )
    )
}
