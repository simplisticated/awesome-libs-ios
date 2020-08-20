import Foundation
import LibraryDemo_Charts

extension Libraries {
    
    static let PNChart = Library(
        id: "pnchart",
        name: "PNChart",
        description: .init(
            short: "A simple and beautiful chart lib used in Piner and CoinsMan for iOS",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "PNChart",
            subtitle: "A simple and beautiful chart lib used in Piner and CoinsMan for iOS"
        ),
        developers: [
            .init(
                name: "kevinzhow",
                contactInformation: ContactInformation(
                    email: nil,
                    website: nil
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "kevinzhow",
                repository: "PNChart"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'PNChart'"
            ),
            carthage: nil,
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demoScreen: nil
    )
}
