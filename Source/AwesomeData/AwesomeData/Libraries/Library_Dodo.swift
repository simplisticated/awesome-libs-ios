import Foundation
import LibraryDemo_Dodo

extension Libraries {
    
    static let Dodo = Library(
        id: "dodo",
        name: "Dodo",
        description: .init(
            short: "UI widget for showing text messages",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Dodo",
            subtitle: "UI widget for showing text messages"
        ),
        developers: [
            .init(
                name: "Evgenii Neumerzhitckii",
                contactInformation: ContactInformation(
                    email: "evgenyneu@gmail.com",
                    website: "http://evgenii.com"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "evgenyneu",
                repository: "Dodo"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Dodo'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"evgenyneu/Dodo\""
            ),
            swiftPackageManager: SwiftPackageManagerIntegration(
                instruction: "https://github.com/evgenyneu/Dodo.git"
            )
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demoScreen: .init(
            viewControllerClass: ViewController.self,
            nibName: nil,
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-Dodo",
            enabled: false
        )
    )
}
