import Foundation

extension Libraries {
    
    static let Parade = Library(
        id: "parade",
        name: "Parade",
        description: .init(
            short: "Parallax scroll-jacking effects engine",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Parade",
            subtitle: "Parallax scroll-jacking effects engine"
        ),
        developers: [
            .init(
                name: "Elephant",
                contactInformation: ContactInformation(
                    email: "tech@helloelephant.com",
                    website: "https://elephant.is"
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "HelloElephant",
                repository: "Parade"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Elephant-Parade'"
            ),
            carthage: nil,
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
