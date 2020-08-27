import Foundation

extension Libraries {
    
    static let Gallery = Library(
        id: "Gallery",
        name: "Gallery",
        description: .init(
            short: "Your next favorite image and video picker",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Gallery",
            subtitle: "Your next favorite image and video picker"
        ),
        developers: [
            .init(
                name: "HyperRedink",
                contactInformation: ContactInformation(
                    email: "technology@hyperredink.no",
                    website: "http://hyperredink.no"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "hyperoslo",
                repository: "Gallery"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Gallery'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"hyperoslo/Gallery\""
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
