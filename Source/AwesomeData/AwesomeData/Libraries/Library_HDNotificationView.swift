import Foundation
import LibraryDemo_HDNotificationView

extension Libraries {
    
    static let HDNotificationView = Library(
        id: "hd-notification-view",
        name: "HDNotification\nView",
        description: .init(
            short: "Emulation of the native Notification Banner UI for any alert",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "HDNotificationView",
            subtitle: "Emulation of the native Notification Banner UI for any alert"
        ),
        developers: [
            .init(
                name: "Nguyen Hai Dang",
                contactInformation: ContactInformation(
                    email: nil,
                    website: "https://www.linkedin.com/in/nhdang103"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "nhdang103",
                repository: "HDNotificationView"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: nil,
            carthage: CarthageIntegration(
                instruction: "github \"nhdang103/HDNotificationView\""
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-HDNotificationView",
                enabled: true
            ),
            appetize: nil
        )
    )
}
