import Foundation
import LibraryDemo_SwiftGif

extension Libraries {
    
    static let SwiftGif = Library(
        id: "swift-gif",
        name: "SwiftGif",
        description: .init(
            short: "Small UIImage extension with GIF support",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "SwiftGif",
            subtitle: "Small UIImage extension with GIF support"
        ),
        developers: [
            .init(
                name: "Arne Bahlo",
                contactInformation: ContactInformation(
                    email: "hallo@arne.me",
                    website: "https://arne.me"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "swiftgif",
                repository: "SwiftGif"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'SwiftGifOrigin'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"bahlo/SwiftGif\""
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-SwiftGif",
                enabled: true
            )
        )
    )
}
