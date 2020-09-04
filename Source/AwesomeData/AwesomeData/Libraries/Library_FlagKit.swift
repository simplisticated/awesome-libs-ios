import Foundation
import LibraryDemo_FlagKit

extension Libraries {
    
    static let FlagKit = Library(
        id: "flag-kit",
        name: "FlagKit",
        description: .init(
            short: "Beautiful flag icons",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "FlagKit",
            subtitle: "Beautiful flag icons"
        ),
        developers: [
            .init(
                name: "Bowtie",
                contactInformation: ContactInformation(
                    email: "howdy@bowtie.se",
                    website: "http://bowtie.se"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "madebybowtie",
                repository: "FlagKit"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "FlagKit"
            ),
            carthage: CarthageIntegration.github(
                withPath: "madebybowtie/FlagKit"
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
                nibName: "",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-FlagKit",
                enabled: true
            )
        )
    )
}
