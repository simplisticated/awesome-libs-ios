import Foundation

extension Libraries {
    
    static let alamofire = Library(
        id: "alamofire",
        name: "Alamofire",
        description: .init(
            short: "HTTP networking library written in Swift, from the creator of AFNetworking",
            full: nil
        ),
        preview: .init(
            logo: Image(
                name: "library_alamofire",
                bundleIdentifier: Bundle.AwesomeData_identifier
            ),
            title: "Alamofire",
            subtitle: "HTTP networking library written in Swift, from the creator of AFNetworking"
        ),
        developers: [
            .init(
                name: "Alamofire Foundation",
                contactInformation: ContactInformation(
                    email: nil,
                    website: nil
                ),
                isCompany: true
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "Alamofire",
                repository: "Alamofire"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "Alamofire"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"Alamofire/Alamofire\""
            ),
            swiftPackageManager: SwiftPackageManagerIntegration(
                instruction: "https://github.com/Alamofire/Alamofire.git"
            )
        ),
        tags: [
            .networking
        ],
        license: .mit(),
        demoScreen: nil
    )
}
