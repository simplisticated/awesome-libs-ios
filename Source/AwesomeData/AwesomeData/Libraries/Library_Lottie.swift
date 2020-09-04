import Foundation

extension Libraries {
    
    static let Lottie = Library(
        id: "lottie",
        name: "Lottie",
        description: .init(
            short: "Real-time rendering of native vector animations from Adobe After Effects",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Lottie",
            subtitle: "Real-time rendering of native vector animations from Adobe After Effects"
        ),
        developers: [
            .init(
                name: "Airbnb",
                contactInformation: ContactInformation(
                    email: nil,
                    website: "https://airbnb.io"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "airbnb",
                repository: "lottie-ios"
            ),
            other: [
                "http://airbnb.io/lottie"
            ]
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "lottie-ios"
            ),
            carthage: CarthageIntegration.github(
                withPath: "airbnb/lottie-ios"
            ),
            swiftPackageManager: SwiftPackageManagerIntegration(
                path: "https://github.com/airbnb/lottie-ios.git"
            )
        ),
        tags: [
            .ui
        ],
        license: .apache_v2(),
        demo: LibraryDemo(
            screen: nil
        )
    )
}
