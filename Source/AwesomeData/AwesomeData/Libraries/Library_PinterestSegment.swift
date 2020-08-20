import Foundation
import LibraryDemo_PinterestSegment

extension Libraries {
    
    static let PinterestSegment = Library(
        id: "pinterest-segment",
        name: "PinterestSegment",
        description: .init(
            short: "Pinterest-like segment control with masking animation",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "PinterestSegment",
            subtitle: "Pinterest-like segment control with masking animation"
        ),
        developers: [
            .init(
                name: "TBXark",
                contactInformation: ContactInformation(
                    email: "tbxark@outlook.com",
                    website: "https://www.tbxark.com"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "TBXark",
                repository: "PinterestSegment"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'PinterestSegment'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"tbxark/PinterestSegment\""
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
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-PinterestSegment",
            enabled: true
        )
    )
}
