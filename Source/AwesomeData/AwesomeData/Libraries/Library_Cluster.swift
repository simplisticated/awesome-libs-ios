import Foundation
import LibraryDemo_Cluster

extension Libraries {
    
    static let Cluster = Library(
        id: "cluster",
        name: "Cluster",
        description: .init(
            short: "Easy map annotation clustering library",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "Cluster",
            subtitle: "Easy map annotation clustering library"
        ),
        developers: [
            .init(
                name: "Lasha Efremidze",
                contactInformation: ContactInformation(
                    email: nil,
                    website: "http://twitter.com/efremidze_"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "efremidze",
                repository: "Cluster"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Cluster'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"efremidze/Cluster\""
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-Cluster",
                enabled: true
            ),
            appetize: nil
        )
    )
}
