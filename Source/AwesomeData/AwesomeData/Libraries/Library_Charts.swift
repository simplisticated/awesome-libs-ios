import Foundation
import LibraryDemo_Charts

extension Libraries {
    
    static let charts = Library(
        id: "charts",
        name: "Charts",
        description: .init(
            short: "A powerful chart / graph framework, the iOS equivalent to MPAndroidChart",
            full: nil
        ),
        preview: .init(
            logo: Image(
                name: "library_charts",
                bundleIdentifier: Bundle.AwesomeData_identifier
            ),
            title: "Charts",
            subtitle: "A powerful chart / graph framework, the iOS equivalent to MPAndroidChart"
        ),
        developers: [
            .init(
                name: "Daniel Cohen Gindi",
                contactInformation: ContactInformation(
                    email: nil,
                    website: nil
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "danielgindi",
                repository: "Charts"
            ),
            other: []
        ),
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'Charts'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"danielgindi/Charts\""
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .apache_v2(),
        demo: LibraryDemo(
            screen: DemoScreen(
                viewControllerClass: LibraryDemoViewController_Charts.self,
                nibName: "DemoListViewController",
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-Charts",
                enabled: true
            ),
            appetize: nil
        )
    )
}
