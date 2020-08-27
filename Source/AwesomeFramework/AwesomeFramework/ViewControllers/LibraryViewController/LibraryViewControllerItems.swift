import Foundation
import AwesomeData

internal struct LibraryViewControllerItems {
    
    static func items(for library: Library) -> [LibraryViewController.Item] {
        var resultItems = Array<LibraryViewController.Item>([
            .sectionInterval,
            .libraryName(
                library: library
            ),
            .developer(
                profile: library.developers.first!
            ),
            .itemInterval,
            .libraryShortDescription(
                text: library.description.short
            ),
            .sectionInterval,
        ])
        
        if let fullDescription = library.description.full {
            resultItems.append(contentsOf: [
                .libraryFullDescription(
                    text: fullDescription
                ),
                .sectionInterval,
            ])
        }
        
        if library.supportsAtLeastOnePackageManager() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Dependency Managers"
                ),
                .itemInterval,
                .separator,
                .packageManagerIntegration(
                    packageManager: .cocoapods,
                    library: library
                ),
                .separator,
                .packageManagerIntegration(
                    packageManager: .carthage,
                    library: library
                ),
                .separator,
                .packageManagerIntegration(
                    packageManager: .swiftPackageManager,
                    library: library
                ),
                .separator,
                .sectionInterval,
            ])
        }
        
        if library.hasLinks() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Sources"
                ),
                .itemInterval,
                .separator
            ])
            
            if let githubLink = library.links.github {
                resultItems.append(contentsOf: [
                    .githubLink(link: githubLink),
                    .separator
                ])
            }
            
            for link in library.links.other {
                resultItems.append(contentsOf: [
                    .repositoryLink(
                        url: link
                    ),
                    .separator
                ])
            }
            
            resultItems.append(
                .sectionInterval
            )
        }
        
        if library.hasDemo() {
            resultItems.append(contentsOf: [
                .sectionTitle(
                    title: "Want to try right now?"
                ),
                .itemInterval,
                .separator
            ])
            
            if let demoScreen = library.demo.screen,
                demoScreen.enabled {
                resultItems.append(contentsOf: [
                    .launchDemoScreen(library: library),
                    .separator
                ])
            }
            
            resultItems.append(
                .sectionInterval
            )
        }
        
        return resultItems
    }
}
