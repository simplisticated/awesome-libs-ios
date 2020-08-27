import Foundation
import LibraryDemo_AnimatedTextInput

extension Libraries {
    
    static let AnimatedTextInput = Library(
        id: "animated-text-input",
        name: "Animated\nTextInput",
        description: .init(
            short: "iOS custom text input component used in the Jobandtalent app",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "AnimatedTextInput",
            subtitle: "iOS custom text input component used in the Jobandtalent app"
        ),
        developers: [
            .init(
                name: "jobandtalent",
                contactInformation: ContactInformation(
                    email: "",
                    website: "https://jobandtalent.com"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "jobandtalent",
                repository: "AnimatedTextInput"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'AnimatedTextInput'"
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-AnimatedTextInput",
                enabled: true
            )
        )
    )
}
