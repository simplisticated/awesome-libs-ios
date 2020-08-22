import Foundation
import LibraryDemo_TinyConsole

extension Libraries {
    
    static let TinyConsole = Library(
        id: "TinyConsole",
        name: "TinyConsole",
        description: .init(
            short: "Log console to display information while using your iOS app",
            full: nil
        ),
        preview: .init(
            logo: Image(
                name: "library_TinyConsole",
                bundleIdentifier: Bundle.AwesomeData_identifier
            ),
            title: "TinyConsole",
            subtitle: "Log console to display information while using your iOS app"
        ),
        developers: [
            .init(
                name: "Devran Cosmo Uenal",
                contactInformation: ContactInformation(
                    email: "me@devranuenal.com",
                    website: "http://devranuenal.com"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "Cosmo",
                repository: "TinyConsole"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: nil,
            carthage: CarthageIntegration(
                instruction: "github \"Cosmo/TinyConsole\""
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-TinyConsole",
                enabled: true
            ),
            appetize: nil
        )
    )
}
