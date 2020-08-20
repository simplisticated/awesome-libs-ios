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
        integration: Integration(
            cocoapods: CocoaPodsIntegration(
                instruction: "pod 'LiquidLoader'"
            ),
            carthage: CarthageIntegration(
                instruction: "github \"yoavlt/LiquidLoader\""
            ),
            swiftPackageManager: nil
        ),
        tags: [
            .ui
        ],
        license: .mit(),
        demoScreen: .init(
            viewControllerClass: LibraryDemoViewController.self,
            nibName: "LibraryDemoViewController",
            bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-LiquidLoader",
            enabled: true
        )
    )
}
