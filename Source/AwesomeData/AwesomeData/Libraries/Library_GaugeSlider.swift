import Foundation
import LibraryDemo_GaugeSlider

extension Libraries {
    
    static let GaugeSlider = Library(
        id: "gauge-slider",
        name: "GaugeSlider",
        description: .init(
            short: "Highly customizable GaugeSlider primarily designed for a Smart Home app",
            full: nil
        ),
        preview: .init(
            logo: nil,
            title: "GaugeSlider",
            subtitle: "Highly customizable GaugeSlider primarily designed for a Smart Home app"
        ),
        developers: [
            .init(
                name: "Edgar Žigis",
                contactInformation: ContactInformation(
                    email: "admin@bio-matic.com",
                    website: "https://www.linkedin.com/in/edgar-%C5%BEigis-48b668a7"
                ),
                isCompany: false
            )
        ],
        links: LibraryLinks(
            github: GitHubRepositoryLink(
                user: "edgar-zigis",
                repository: "GaugeSlider"
            ),
            other: []
        ),
        integration: LibraryPackageManagers(
            cocoapods: CocoaPodsIntegration(
                podName: "GaugeSlider"
            ),
            carthage: CarthageIntegration.github(
                withPath: "edgar-zigis/GaugeSlider"
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
                bundleIdentifier: "com.wizman.awesome-libraries.LibraryDemo-GaugeSlider",
                enabled: true
            )
        )
    )
}
