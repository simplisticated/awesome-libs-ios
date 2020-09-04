import Foundation

extension Libraries {
    
    static let SwiftMessages = Library(
        id: "swift-messages",
        name: "SwiftMessages",
        description: .init(
            short: "A very flexible view and view controller presentation library",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "SwiftMessages",
            subtitle: "A very flexible view and view controller presentation library"
        ),
        developers: [
            .init(
                name: "SwiftKick Mobile",
                contactInformation: ContactInformation(
                    email: "hello@swiftkick.it",
                    website: "http://www.swiftkickmobile.com"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "SwiftKickMobile",
                repository: "SwiftMessages"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "SwiftMessages"
            ),
            carthage: CarthageIntegration.github(
                withPath: "SwiftKickMobile/SwiftMessages"
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demo: LibraryDemo(
            screen: nil
        )
    )
}
