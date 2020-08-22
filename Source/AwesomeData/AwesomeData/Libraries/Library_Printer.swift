import Foundation
import LibraryDemo_Printer

extension Libraries {
    
    static let Printer = Library(
        id: "Printer",
        name: "Printer",
        description: .init(
            short: "Fancy logger for your next app",
            full: nil
        ),
        preview: .init(
            logo: Image(
                name: "library_printer",
                bundleIdentifier: Bundle.AwesomeData_identifier
            ),
            title: "Printer",
            subtitle: "Fancy logger for your next app"
        ),
        developers: [
            .init(
                name: "hemangshah",
                contactInformation: ContactInformation(
                    email: "hemangshah.in@gmail.com",
                    website: "https://hemangshah.github.io"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "hemangshah",
                repository: "printer"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'printer-logger'"
            ),
            carthage: nil,
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demo: LibraryDemo(
            screen: DemoScreen(
                viewControllerClass: Printer_LibraryDemoViewController.self,
                nibName: "Printer_LibraryDemoViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-Printer",
                enabled: true
            ),
            appetize: nil
        )
    )
}
