import Foundation
import LibraryDemo_fluentui_system_icons

extension Libraries {
    
    static let fluentui_system_icons = Library(
        id: "fluentui-system-icons",
        name: "fluentui-system-icons",
        description: .init(
            short: "Collection of familiar, friendly and modern icons from Microsoft",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "fluentui-system-icons",
            subtitle: "Collection of familiar, friendly and modern icons from Microsoft"
        ),
        developers: [
            .init(
                name: "Microsoft",
                contactInformation: ContactInformation(
                    email: "opensource@microsoft.com",
                    website: "https://opensource.microsoft.com"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "microsoft",
                repository: "fluentui-system-icons"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'FluentIcons'"
            ),
            carthage: CarthageIntegration(
                instruction: "git \"git@github.com:microsoft/fluentui-system-icons.git\""
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
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-fluentui-system-icons",
            enabled: true
        )
    )
}
