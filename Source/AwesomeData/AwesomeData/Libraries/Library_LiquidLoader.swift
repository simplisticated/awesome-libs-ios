import Foundation
import LibraryDemo_LiquidLoader

extension Libraries {
    
    static let LiquidLoader = Library(
        id: "liquid-loader",
        name: "LiquidLoader",
        description: .init(
            short: "Loader components with liquid animation",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "LiquidLoader",
            subtitle: "Loader components with liquid animation"
        ),
        developers: [
            .init(
                name: "Takuma Yoshida",
                contactInformation: ContactInformation(
                    email: "me@yoavlt.com",
                    website: nil
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "yoavlt",
                repository: "LiquidLoader"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "LiquidLoader"
            ),
            carthage: CarthageIntegration.git(
                withPath: "yoavlt/LiquidLoader"
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-LiquidLoader",
                enabled: true
            )
        )
    )
}
