import Foundation
import LibraryDemo_LinearProgressBar

extension Libraries {
    
    static let LinearProgressBar = Library(
        id: "linear-progress-bar",
        name: "Linear\nProgressBar",
        description: .init(
            short: "Linear progress bar inspired by Google Material Design",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "LinearProgressBar",
            subtitle: "Linear progress bar inspired by Google Material Design"
        ),
        developers: [
            .init(
                name: "Philippe Boisney",
                contactInformation: ContactInformation(
                    email: "phil.boisney@gmail.com",
                    website: "https://medium.com/@Phil_Boisney"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "PhilippeBoisney",
                repository: "LinearProgressBar"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'LinearProgressBarMaterial'"
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
                viewControllerClass: LibraryDemoViewController.self,
                nibName: "LibraryDemoViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-LinearProgressBar",
                enabled: true
            ),
            appetize: nil
        )
    )
}
