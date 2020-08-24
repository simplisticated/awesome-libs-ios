import Foundation
import LibraryDemo_PhoneNumberKit

extension Libraries {
    
    static let PhoneNumberKit = Library(
        id: "PhoneNumberKit",
        name: "Phone\nNumberKit",
        description: .init(
            short: "Framework for parsing, formatting and validating international phone numbers",
            full: nil
        ),
        preview: .init(
            logo: Image(
                name: "library_PhoneNumberKit",
                bundleIdentifier: Bundle.AwesomeData_identifier
            ),
            title: "PhoneNumberKit",
            subtitle: "Framework for parsing, formatting and validating international phone numbers"
        ),
        developers: [
            .init(
                name: "Roy Marmelstein",
                contactInformation: ContactInformation(
                    email: "hello@roysapps.com",
                    website: "http://marmelroy.github.io"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "marmelroy",
                repository: "PhoneNumberKit"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'PhoneNumberKit'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"marmelroy/PhoneNumberKit\""
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
                nibName: "",
                bundleIdentifier: Bundle.PhoneNumberKit_identifier,
                enabled: true
            ),
            appetize: nil
        )
    )
}
