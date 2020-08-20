import Foundation
import LibraryDemo_StarWars

extension Libraries {
    
    static let StarWars = Library(
        id: "star-wars",
        name: "StarWars",
        description: .init(
            short: "This component implements transition animation to crumble view-controller into tiny pieces",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "StarWars",
            subtitle: "This component implements transition animation to crumble view-controller into tiny pieces"
        ),
        developers: [
            .init(
                name: "Yalantis",
                contactInformation: ContactInformation(
                    email: "hello@yalantis.com",
                    website: "https://yalantis.com"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "Yalantis",
                repository: "StarWars.iOS"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'StarWars'"
            ),
            carthage: nil,
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demoScreen: .init(
            viewControllerClass: LibraryDemoViewController.self,
            nibName: "",
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-StarWars",
            enabled: false
        )
    )
}
