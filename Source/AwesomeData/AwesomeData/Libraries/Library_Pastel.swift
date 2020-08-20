import Foundation
import LibraryDemo_Pastel

extension Libraries {
    
    static let Pastel = Library(
        id: "pastel",
        name: "Pastel",
        description: .init(
            short: "Gradient animation effect like Instagram",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Pastel",
            subtitle: "Gradient animation effect like Instagram"
        ),
        developers: [
            .init(
                name: "Cruz",
                contactInformation: ContactInformation(
                    email: "cruzdiary@gmail.com",
                    website: "http://stackoverflow.com/users/1878594/swiftycruz"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "cruisediary",
                repository: "Pastel"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Pastel'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"cruisediary/Pastel\""
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
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-Pastel",
            enabled: true
        )
    )
}
